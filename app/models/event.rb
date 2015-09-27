class Event < ActiveRecord::Base
  has_many :attendees
  belongs_to :hash_kennel
  validates :name, presence: true
  validates :cost, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :hash_kennel, presence: true
  geocoded_by :location
  after_validation :geocode

  MARKER_COUNT = 211.freeze
  MARKER_PATH = 'images/markers'.freeze

  scope :upcoming, -> { where('date > ?', DateTime.now).order('date ASC, created_at ASC') }

  def create_identity_sets(params)
    name_array = params[:names]
    kennel_array = params[:kennels]
    identities = []
    name_array.each_with_index do |name, index|
      identities << { name: name, kennel: kennel_array[index], email: params[:stripeEmail]}
    end
    identities.reject { |id| id[:name].blank? }
  end

  def stringify_cost(cost=self.cost)
    Money.us_dollar(BigDecimal.new(cost, 3) * 100).format
  end

  def successful_payment_notice(cost, count, event_name)
    "#{stringify_cost(cost)} paid for #{event_name} registration for #{count} #{count > 1 ? 'people' : 'person'}"
  end

  def register(params)
    attendee_array = create_identity_sets(params)
    attendee_count = attendee_array.length
    total =  attendee_count * BigDecimal.new(self.cost, 3)

    stripe_response = StripeGateway.charge(params[:stripeToken], total * 100, "#{stringify_cost} paid for #{self.name} registration")
    response = {}

    if stripe_response[:success]
      response.merge!({ success: true, message: successful_payment_notice(total, attendee_count, self.name) })
      attendee_array.each do |person|
        person.merge!({ event_id: params[:id]})
        x = Attendee.create(person)
        logger.debug x.errors.full_messages
      end
    else
      response.merge!({ success: false, message: stripe_response[:error] })
    end
    response
  end

  def rego_allowed?
    self.allow_rego? && self.hash_kennel.allow_rego?
  end

  def set_marker
    { url: "#{MARKER_PATH}/#{calculate_marker}", width:  30, height: 42, anchor: [6,36] }
  end

  def calculate_marker
    count = Event.upcoming.count
    return 'onon_marker_0.png' if count <= 1
    last = Event.upcoming.order('date ASC').last.date
    first = Event.upcoming.order('date ASC').first.date
    scaling_factor = calculate_scaling_factor(count, (seconds_to_days(last - first))).round(2)
    marker_id = seconds_to_days(self.date - first) * scaling_factor
    "onon_marker_#{marker_id.round}.png"
  end

  private

  def calculate_scaling_factor(event_total, event_date_range)
    MARKER_COUNT / event_date_range
  end

  def seconds_to_days(seconds)
    seconds / 60 / 60 / 24
  end

end

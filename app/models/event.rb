class Event < ActiveRecord::Base
  has_many :attendees
  belongs_to :hash_kennel
  validates :name, presence: true
  validates :cost, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :hash_kennel, presence: true

  def create_identity_sets(params)
    name_array = params[:names]
    kennel_array = params[:kennels]
    identities = []
    name_array.each_with_index do |name, index|
      identities << { name: name, kennel: kennel_array[index], email: params[:stripeEmail]}
    end
    identities.reject { |id| id[:name].blank? }
  end

  def stringify_cost(cost)
    BigDecimal.new(cost, 3).to_s
  end

  def successful_payment_notice(cost, count, event_name)
    "#{stringify_cost(cost)} paid for #{event_name} registration for #{count} #{count > 1 ? 'people' : 'person'}"
  end

  def register(params)
    attendee_array = create_identity_sets(params)
    attendee_count = attendee_array.length
    total =  attendee_count * BigDecimal.new(self.cost, 3)

    stripe_response = StripeGateway.charge(params[:stripeToken], total * 100, "#{stringify_cost(self.cost)} paid for #{self.name} registration")
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

end

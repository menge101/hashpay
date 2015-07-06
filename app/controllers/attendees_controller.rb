class AttendeesController < ApplicationController
  def index
    @event = { name: 'P3H3 Inaug',
               cost: 5.00,
               date: Time.zone.parse('2015-08-02 14:00:00'),
               description: 'The first run of the Pittsburgh area Family hash',
               location: 'Sanders St & Richmond Ave, Pittsburgh pa' }
  end

  def create
    @event = { name: 'P3H3 Inaug',
               cost: 5.01,
               date: Time.zone.parse('2015-08-02 14:00:00'),
               description: 'The first run of the Pittsburgh area Family hash',
               location: 'Sanders St & Richmond Ave, Pittsburgh pa' }

    attendee_array = create_identity_sets(params)
    attendee_count = attendee_array.length
    cost =  attendee_count * @event[:cost]

    stripe_response = StripeGateway.charge(params[:stripeToken], cost * 100, "#{stringify_cost(cost)} paid for #{@event[:name]} registration")

    if stripe_response[:success]
      attendee_array.each do |person|
        x = Attendee.create(person)
        logger.debug x.errors.full_messages
      end
      redirect_to :whosecoming, notice: successful_payment_notice(@event[:cost], attendee_count, @event[:name])
    else
      redirect_to :back, alert: stripe_response[:error]
    end
  end

  def view
    @event = { name: 'P3H3 Inaug',
               cost: 5.01,
               date: Time.zone.parse('2015-08-02 14:00:00'),
               description: 'The first run of the Pittsburgh area Family hash',
               location: 'Sanders St & Richmond Ave, Pittsburgh pa' }
    @hashers = Attendee.all.order('kennel, name DESC')
  end

  def create_identity_sets(params)
    name_array = params[:names]
    kennel_array = params[:kennel]
    identities = []
    name_array.each_with_index do |name, index|
      identities << { name: name, kennel: kennel_array[index], email: params[:stripeEmail]}
    end
    identities.reject { |id| id[:name].blank? }
  end

  def stringify_cost(cost)
    dollars = cost.to_i
    cents = cost * 100 % 100
    "#{dollars.to_s}.#{cents}"
  end

  def successful_payment_notice(cost, count, event_name)
    "#{stringify_cost(cost)} paid for #{event_name} registration for #{count} #{count > 1 ? 'people' : 'person'}"
  end
end

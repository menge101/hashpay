class AttendeesController < ApplicationController
  def index
    @event = { name: 'P3H3 Inaug',
               cost: 5.00,
               date: Time.zone.parse('2015-08-02 14:00:00'),
               description: 'The first run of the Pittsburgh area Family hash',
               location: 'Sanders St & Richmond Ave, Pittsburgh pa' }
  end

  def create
    puts params[:stripeToken]
    current_attendee = Attendee.new do |a|
      a.name = params[:name]
      a.hash_name = params[:hash_name]
      a.home_kennel = params[:kennel]
      a.email = params[:stripeEmail]
      a.stripe_token = params[:stripeToken]
      a.pay_status = false
    end

    x = current_attendee.pay(@event_cost, @event_name)
    puts x

    if current_attendee.pay_status
      redirect_to :view, flash: x
    else
      redirect_to :back, flash: x
    end
  end

  def view

  end
end

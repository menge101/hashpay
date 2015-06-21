class AttendeesController < ApplicationController
  def index
    @event_name = 'P3H3 Inaug'
    @event_cost = 5.00
    @description = "#{@event_name} payment"
    @public_key = Rails.application.secrets.stripe_publishable_key
    puts @public_key
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

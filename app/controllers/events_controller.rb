class EventsController < ApplicationController
  def index
    @event = Event.first
  end

  def register
    @event = Event.find(params[:id])
    response = @event.register(params)
    if response[:success]
      redirect_to :whosecoming, notice: response[:message]
    else
      redirect_to :back, alert: response[:message]
    end
  end

  def view
    @event = Event.find(params[:id])
    @hashers = Attendee.all.order('kennel, name DESC')
  end

end

class EventsController < ApplicationController
  def index
    @events = Event.upcoming
    @markers = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.picture event.set_marker
      marker.infowindow render_to_string(partial: "/events/event_info_window", locals: { event: event })
    end
  end

  def registration
    @event = Event.find(params[:id])
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

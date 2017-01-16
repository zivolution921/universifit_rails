class EventRegistrationsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @event_registrations = @event.event_registrations
  end
end

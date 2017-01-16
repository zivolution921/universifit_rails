class EventRegistrationsController < ApplicationController
  before_action :set_event
  def index   
    @event_registrations = @event.event_registrations
  end

  def new
    @event_registration = @event.event_registrations.new
  end

  def create
    @event_registration = @event.event_registrations.new(event_registration_params)
    if @event_registration.save
      redirect_to event_event_registrations_path(@event),
                            notice: "Thanks, you're registered!"
    else
      render :new
    end
  end

  private

  def event_registration_params
    params.require(:event_registration).permit(:name, :email, :how_heard)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end

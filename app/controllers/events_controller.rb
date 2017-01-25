class EventsController < ApplicationController
  def index
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    @likers = @event.likers
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Event successfully updated!"
      redirect_to @event
    else 
      render :edit
    end
  end

  def new
    @event = current_user.profile.events.build
  end

  def create
    @event = current_user.profile.events.build(event_params)

    if @event.save
      flash[:notice] = "Event was successfully created!"
      redirect_to @event
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end

private

  def event_params
    params.require(:event).
      permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity)
  end

end

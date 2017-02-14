class ProfilesController < ApplicationController
  def new
    @profile = current_user.build_profile
  end

  def edit
    @profile ||= current_user.profile
  end

  def create
    @profile = current_user.create_profile(profile_params)
    if(@profile.valid?)
      redirect_to @profile
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile
    if(@profile.update_attributes(profile_params))
      redirect_to @profile
    else
      render :edit
    end
  end

  def show
    @event_registrations = profile.event_registrations
    @liked_events = profile.liked_events
  end

  private

  def profile
    @profile ||= Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :custom_location, :location_id)
  end
end
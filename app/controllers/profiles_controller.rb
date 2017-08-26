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
    if(current_profile.update_attributes(profile_params))
      respond_to do |format|
        format.html { redirect_to current_profile }
        format.json { render json: current_profile.to_json }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: current_profile.to_json }
      end
      
    end
  end

  def show
    @event_registrations = profile.event_registrations
    @liked_events = profile.liked_events
    #@activities = PublicActivity::Activity.where(owner_id: profile.id)
  end

  private

  def profile
    @profile ||= Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :custom_location, :location_id, :zipcode, :avatar_url)
  end

end
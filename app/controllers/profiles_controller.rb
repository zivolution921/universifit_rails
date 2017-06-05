class ProfilesController < ApplicationController

  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

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
    #@activities = PublicActivity::Activity.where(owner_id: profile.id)
  end

  private

  def profile
    @profile ||= Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :custom_location, :location_id, :zipcode)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
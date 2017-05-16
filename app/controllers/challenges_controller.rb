class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def new
    challenged
    new_challenge
  end

  def show
  end

  def create
    category = ChallengeCategory.find(challenge_params[:category])
    if new_challenge(challenge_params.merge(category: category)).save
      challenged.user.notifications.create!(
        message: "You have been challenged by #{current_user.profile.name}!", 
        notification_type: NotificationType.find_by(name: "Challenges"))
      redirect_to :dashboard
    else
      render :new
    end
  end

  private

  def challenged
    @challenged ||= Profile.find(params[:profile_id])
  end

  def new_challenge(attrs={})
    @challenge ||= current_profile.challenges_sent.build(
      attrs.merge(challenged_id: params[:profile_id]))
  end

  def challenge_params
    params.require(:challenge).permit(:challenged_id, :text, :category)
  end

end

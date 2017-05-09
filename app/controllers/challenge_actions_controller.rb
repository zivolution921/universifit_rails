class ChallengeActionsController < ApplicationController
  before_action :authenticate_user!

  def create
    byebug
    case params[:challenge_action].to_sym
    when :accept
      challenge.accept!(current_profile)
    when :reject
      challenge.reject!(current_profile)
    when :complete
      challenge.complete!(current_profile)
    end
    redirect_to :back
  end

  private

  def challenge
    @challenge ||= Challenge.find(params[:challenge_id])
  end
end
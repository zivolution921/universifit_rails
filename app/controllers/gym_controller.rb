class GymController < InheritedResources::Base
  before_action :set_gym, only:[:show]
  def show
  end
  private
    def gym_params
      params.require(:gym).permit(:address, :latitude, :longitude)
    end
    def set_gym
      @gym = Gym.find(params[:id])
    end
end


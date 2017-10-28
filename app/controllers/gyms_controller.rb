class GymsController < InheritedResources::Base

  private

    def gym_params
      params.require(:gym).permit(:latitude, :longitude)
    end
end


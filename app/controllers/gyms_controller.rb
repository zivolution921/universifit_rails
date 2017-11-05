class GymsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @location_info = request.ip
    @current_user.ip = location_info
    puts location_info
    @uloc = request.location
  end

end


class GymsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @client = GooglePlaces::Client.new("AIzaSyCEdd9xVqSuVr_LOiq_plb0QZe9laI4jV8")
    puts request.location.latitude
    @restaurants = @client.spots(request.location.latitude, request.location.longitude, types: 'gym')
  end

end


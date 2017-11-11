class GymsController < InheritedResources::Base
  include V1::Gyms::Creation
  before_action :authenticate_user!

  def index
    #@cordinates = Geocoder.coordinates(request.ip)
    @coordinates = Geocoder.coordinates(request.remote_ip)
    puts request.remote_ip
    puts @coordinates[0]
    @client = GooglePlaces::Client.new("AIzaSyCEdd9xVqSuVr_LOiq_plb0QZe9laI4jV8")
    gyms = @client.spots(@coordinates[0], @coordinates[1], types: 'gym', radius: 3000 )
    @lobs = @client.spots(@coordinates[0], @coordinates[1], types: 'gym', radius: 3000 )
    create_all_gyms(gyms)
  end
  def join_gym
  
  end

end


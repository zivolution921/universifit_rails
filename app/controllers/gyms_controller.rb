class GymsController < InheritedResources::Base
  include Gyms::Creation
  before_action :authenticate_user!

  def index
    #@cordinates = Geocoder.coordinates(request.ip)
    @coordinates = Geocoder.coordinates(request.remote_ip)
    puts request.remote_ip
    puts @coordinates[0]
    @client = GooglePlaces::Client.new("AIzaSyCEdd9xVqSuVr_LOiq_plb0QZe9laI4jV8")
    gyms = @client.spots(@coordinates[0], @coordinates[1], types: 'gym', radius: 3000 )
     gyms.each do |g|
          Gym.create(name:g.name, latitude: @coordinates[0], longitude: @coordinates[1])
     end
    @lobs = Gym.where("latitude >= ? and latitude<= ? and longitude >= ? and longitude <= ?",@coordinates[0]-0.9,@coordinates[0]+0.9, @coordinates[1]-0.9, @coordinates[1]+0.9)
  end
  def join_gym
    @user = current_user
    UserGym.create(gym_id:params[:gym_id],user_id:@user)
  end

  def members
    @gym = Gym.find(params[:id])
    @members = @gym.users
  end

end


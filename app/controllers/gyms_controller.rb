class GymsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    #@cordinates = Geocoder.coordinates(request.ip)
    @coordinates = Geocoder.coordinates(request.remote_ip)
    puts "hellldfjldsajflsdajf;jdaslf;safjasd;kjfasjf;safjk;adsjf;dsajfkl;sdakjfdas;o"
    puts request.remote_ip
    puts @coordinates[0]
    @client = GooglePlaces::Client.new("AIzaSyCEdd9xVqSuVr_LOiq_plb0QZe9laI4jV8")
    @gyms = @client.spots(@coordinates[0], @coordinates[1], types: 'gym')
  end

end


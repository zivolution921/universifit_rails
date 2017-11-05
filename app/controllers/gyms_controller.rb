class GymsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @data = Array.new()
    @userLocation = request.location
    #@searchResults = Geocoder.search("gym")
   # @gyms = @searchResults.near(@userLocation, 5000, :order => :distance)
  end

end


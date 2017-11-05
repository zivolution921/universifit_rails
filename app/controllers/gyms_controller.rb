class GymsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
  end

end


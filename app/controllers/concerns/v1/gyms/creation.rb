module V1
  module Gyms
    module Creation 
      extend ActiveSupport::Concern
      def create_all_gyms(gyms,lat,long)
        if gyms.nil?
          gyms.each do |g|
            Gym.create(name:g.name, latitude: lat, longitude:long)
          end
        end
      end
    end
  end
end

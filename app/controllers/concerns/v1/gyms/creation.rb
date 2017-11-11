module V1
  module Gyms
    module Creation 
      extend ActiveSupport::Concern
      def create_all_gyms(gyms)
        if gyms.nil?
          gyms.each do |g|
            Gym.create(name:g.name, latitude: g.latitude, longitude:g.longitude)
          end
        end
      end
    end
  end
end

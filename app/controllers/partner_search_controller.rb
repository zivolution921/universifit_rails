class PartnerSearchController < ApplicationController
  def index
    @partners = Availability.joins(:profile).
                             where('profiles.zipcode = ?', current_profile.zipcode)
  end
end
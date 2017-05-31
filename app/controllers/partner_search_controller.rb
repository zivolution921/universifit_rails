class PartnerSearchController < ApplicationController
  def index
    byebug
    @partners = Exercise.joins(:profile).joins(:exercise_category)
    if params[:zipcode].present?
      @partners = @partners.where("profiles.zipcode = ? ", params[:zipcode])
    end
    if params[:category].present?
      @partners = @partners.where("exercise_categories.name = ? ", params[:category])
    end
  end
end
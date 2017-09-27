class PartnerSearchController < ApplicationController
  def index

    @partners = Exercise.joins(:profile).joins(:exercise_category)
    if params[:zipcode].present?
      @partners = @partners.where("profiles.zipcode = ? ", params[:zipcode])
    end
    if params[:type].present?
      @partners = @partners.where("exercise_categories.id = ? ", params[:type])
    end
    if params[:date].present?
      starts_at = Date.parse(params[:date]).beginning_of_day
      ends_at = Date.parse(params[:date]).end_of_day
      @partners = @partners.where(starts_at: starts_at..ends_at)
    end

  end
end

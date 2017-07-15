class DashboardController < ApplicationController
  before_action :set_s3_direct_post

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  private

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
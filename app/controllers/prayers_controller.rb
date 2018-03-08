class PrayersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index], raise: false

  def index
    @prayers = Prayer.all
  end

  def new
    @prayer = Prayer.new
  end

  def create
    prayer = Prayer.new(prayer_params)
    prayer.author = current_user
    
  end




  private

  def prayer_params
    params.require("prayer").permit(:overview, :details, :is_anonymous, :is_public)
  end
end

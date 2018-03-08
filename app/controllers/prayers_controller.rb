class PrayersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index], raise: false

  def index
    @prayers = Prayer.all_public
  end

  def new
    @prayer = Prayer.new
  end

  def create
    prayer = Prayer.new(prayer_params)
    prayer.author = current_user
    
    if prayer.save
      flash[:notice] = "Successfully shared a prayer"
      redirect_to prayers_path
    else
      flash[:alert] = prayer.errors.full_messages.to_sentence
      redirect_to new_prayer_path
    end
  end




  private

  def prayer_params
    params.require("prayer").permit(:overview, :details, :is_anonymous, :is_public)
  end
end

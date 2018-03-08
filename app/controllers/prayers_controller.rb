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

  def show
    @prayer = Prayer.find(params[:id])
  end

  def edit
    @prayer = Prayer.find(params[:id])
  end

  def update
    raise params
  end

  def destroy
    prayer = Prayer.find(params[:id])
    prayer.destroy
		flash[:notice] = "Prayer was deleted"
		redirect_to prayers_path
  end



  private

  def prayer_params
    params.require("prayer").permit(:overview, :details, :is_anonymous, :is_public)
  end
end

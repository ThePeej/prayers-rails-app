class PrayersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index], raise: false

  def index
    @prayers = Prayer.all
  end

  def new
    # raise current_user.inspect
  end
end

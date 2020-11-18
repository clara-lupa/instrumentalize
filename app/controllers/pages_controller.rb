class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @user = current_user
    @instruments = @user.instruments
    @rentals_as_renter = @user.rentals
    # implement also for rentals as owner?
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @user = current_user
    @instruments = policy_scope(Instrument).where(user: current_user)
    @rentals_as_renter = @user.rentals
    # implement also for rentals as owner?
  end
end

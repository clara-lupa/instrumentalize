class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    console
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @rental = Rental.new
    @instrument = Instrument.find(params[:instrument_id])
    @rental.user = current_user
    @rental.instrument = @instrument
    @rental.start_date = params[:rental][:start_date]
    @rental.end_date = params[:rental][:end_date]
    if @rental.save
      redirect_to instruments_path
    else
      render :new
    end
  end
end

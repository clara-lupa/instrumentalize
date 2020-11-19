class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @instrument = Instrument.find(params[:instrument_id])
    authorize @rental
  end

  def create
    @rental = Rental.new
    @instrument = Instrument.find(params[:instrument_id])
    @rental.user = current_user
    @rental.instrument = @instrument
    @rental.start_date = params[:rental][:start_date]
    @rental.end_date = params[:rental][:end_date]
    authorize @rental
    if @rental.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @instrument = Instrument.find(params[:instrument_id])
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def update
    @instrument = Instrument.find(params[:instrument_id])
    @rental = Rental.find(params[:id])
    @rental.start_date = params[:rental][:start_date]
    @rental.end_date = params[:rental][:end_date]
    authorize @rental
    if @rental.save
      redirect_to instruments_path
    else
      render :edit
    end
  end
end

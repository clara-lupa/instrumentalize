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
      redirect_to instruments_path
    else
      render :new
    end
  end

   def edit
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def update
    @rental = Rental.find(params[:id])
    authorize @rental
    @rental.update(rental_params)
    redirect_to instrument_path(@instrument)
  end
end

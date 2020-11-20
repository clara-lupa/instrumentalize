class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @location = params[:location]
    if params[:query].present?
      @instruments = policy_scope(Instrument).where("name ILIKE ?", "%#{params[:query]}%")
    else
      @instruments = policy_scope(Instrument).order(created_at: :desc)
    end

    @markers = @instruments.geocoded.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { instrument: instrument })
      }
    end

    @instruments = @instruments.sort_by{ |instrument| instrument.distance(@location) }
    @user = current_user
  end

  def show
    @rental = Rental.new
    @instrument = Instrument.find(params[:id])
#following line is just for tests and has to be replaced
    @location = "Berlin"
    authorize @instrument
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    authorize @instrument
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def update
    @instrument = Instrument.find(params[:id])
    authorize @instrument
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    redirect_to instruments_path
    authorize @instrument
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :description, :price_per_day, :address, :photo)
  end
end

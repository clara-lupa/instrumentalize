class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # => <ActionController::Parameters {"query"=>"viola", "location"=>"Hermannstr. 48, Berlin", "commit"=>"Search", "controller"=>"instruments", "action"=>"index"} permitted: false>
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
    console
  end

  def show
    @instrument = Instrument.find(params[:id])
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
    params.require(:instrument).permit(:name, :description, :price_per_day, :photo)
  end
end

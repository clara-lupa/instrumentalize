class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = policy_scope(Instrument).order(created_at: :desc)
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
    @instrument.name = params[:instrument][:name]
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
    params.require(:instrument).permit(:name, :description, :price_per_day)
  end
end

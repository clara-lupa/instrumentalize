class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show

  end
end

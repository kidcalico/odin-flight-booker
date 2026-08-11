class BookingsController < ApplicationController
  def new
    @passenger_count = params[:passenger_count]
    @flight = params[flight.id]
  end
end

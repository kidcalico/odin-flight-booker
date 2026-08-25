class BookingsController < ApplicationController
  def new
    @passenger_count = params[:passenger_count]
    @flight_id = params[:flight_id]
    @flight = Flight.find_by(id: params[:flight_id])
    @passengers = []

    @booking = Booking.new

    @passenger_count.to_i.times do
      @booking.passengers.build
    end
  end
end

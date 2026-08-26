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

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, :passenger_count, passengers_attributes: [ :name, :email ])
    end
end

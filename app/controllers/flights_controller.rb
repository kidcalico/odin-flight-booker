class FlightsController < ApplicationController
  def index
    # @flights = Flight.all
    @airports = Airport.all.map { |a| [ a.name, a.code ] }
    @dates = Flight.pluck(:departure_time).map { |datetime| datetime.to_date }.uniq

    if params[:departure_airport].present?
      departure_airport = Airport.find_by(code: params[:departure_airport])
      arrival_airport = Airport.find_by(code: params[:arrival_airport])
      date = params[:departure_time].to_date
      @flights = Flight.where(departure_airport_id: departure_airport.id)
                        .where(arrival_airport_id: arrival_airport.id)
                        .where(departure_time: date.beginning_of_day..date.end_of_day)
    end
  end
end

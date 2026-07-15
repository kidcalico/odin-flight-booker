class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all.map { |a| [ a.name, a.code ] }
    @dates = Flight.pluck(:departure_time).map { |datetime| datetime.to_date }.uniq
  end
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Populating database..."

airports = [ [ "SAN", "San Diego International Airport" ], [ "JFK", "John F. Kennedy International Airport" ], [ "BOM", "Mumbai International Airport" ] ]

airports.each do |location|
  Airport.create do |airport|
    airport.name = location[1]
    airport.code = location[0]
  end
end

departures = Airport.all
arrivals = Airport.all

offset = 0

7.times do
  departures.each do |departure|
    arrivals.each do |arrival|
      unless departure.code == arrival.code
        2.times do
          Flight.create do |flight|
            flight.departure_time = rand((Time.current + offset.days)..(1.day.from_now + offset.days))
            flight.duration = rand(300..720)
            flight.arrival_time = flight.departure_time + flight.duration.minutes
            flight.departure_airport = departure
            flight.arrival_airport = arrival
          end
        end
      end
    end
  end
  offset += 1
end

puts "Database seeded."

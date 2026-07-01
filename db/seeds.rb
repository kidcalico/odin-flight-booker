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

flights = [ { departure_time: "2026-07-05 08:30:00", departure_airport_id: Airport.find_by(code: "SAN").id, arrival_time: "2026-07-05 14:00:00", arrival_airport_id: Airport.find_by(code: "JFK").id, duration: 330 }, { departure_time: "2026-07-05 10:30:00", departure_airport_id: Airport.find_by(code: "SAN").id, arrival_time: "2026-07-05 16:00:00", arrival_airport_id: Airport.find_by(code: "JFK").id, duration: 330 }, { departure_time: "2026-07-05 16:30:00", departure_airport_id: Airport.find_by(code: "SAN").id, arrival_time: "2026-07-05 22:00:00", arrival_airport_id: Airport.find_by(code: "JFK").id, duration: 330 } ]

flights.each do |hash|
  Flight.create do |flight|
    flight.departure_time = hash[:departure_time]
    flight.arrival_time = hash[:arrival_time]
    flight.departure_airport_id = hash[:departure_airport_id]
    flight.arrival_airport_id = hash[:arrival_airport_id]
    flight.duration = hash[:duration]
  end
end
puts "Database seeded."

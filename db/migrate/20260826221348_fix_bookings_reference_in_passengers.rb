class FixBookingsReferenceInPassengers < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :passengers, column: :booking_id
    add_foreign_key :passengers, :bookings, column: :booking_id
  end
end

class RenamePassengerIdToBookingIdInPassengers < ActiveRecord::Migration[8.1]
  def change
    rename_column :passengers, :passenger_id, :booking_id
  end
end

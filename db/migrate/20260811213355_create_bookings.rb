class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true
      t.integer :passenger_count

      t.timestamps
    end
  end
end

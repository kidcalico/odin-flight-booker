class AddBookingsReferenceToPassenger < ActiveRecord::Migration[8.1]
  def change
    add_reference :passengers, :passenger, null: false, foreign_key: true
  end
end

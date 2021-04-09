class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :hotel_id, index: true
      t.integer :customer_id, index: true
      t.integer :room_id, index: true
      t.integer :room_rate_id, index: true
      t.string :arrival_date
      t.string :departure_date
      t.string :booked_check_in
      t.string :booked_check_out
      t.integer :no_of_rooms
      t.integer :no_of_adults
      t.integer :no_of_child
      t.integer :reservation_type
      t.integer :book_status
      
      t.timestamps
    end
  end
end

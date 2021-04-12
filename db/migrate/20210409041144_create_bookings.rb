class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :hotel_id, index: true
      t.integer :customer_id, index: true
      t.integer :room_id, index: true
      t.integer :room_rate_id, index: true
      t.datetime :arrival_date
      t.datetime :departure_date
      t.datetime :booked_check_in
      t.datetime :booked_check_out
      t.integer :no_of_rooms
      t.integer :no_of_adults
      t.integer :no_of_child, default: 0
      t.integer :reservation_type
      t.integer :book_status
      t.string :booking_code

      t.timestamps
    end
  end
end

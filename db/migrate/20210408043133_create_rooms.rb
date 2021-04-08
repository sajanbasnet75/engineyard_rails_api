class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :hotel_id, index: true
      t.string :name
      t.string :description
      t.integer :room_type
      t.integer :room_class
      t.integer :total_quantity, default: 0
      t.integer :total_booked, default: 0

      t.timestamps
    end
  end
end

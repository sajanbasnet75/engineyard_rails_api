class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :hotel_id, index: true
      t.string :name
      t.string :description
      t.integer :room_type
      t.integer :room_class
      t.integer :total_quantity
      t.integer :available_quantiy

      t.timestamps
    end
  end
end

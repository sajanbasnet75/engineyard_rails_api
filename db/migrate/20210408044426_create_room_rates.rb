class CreateRoomRates < ActiveRecord::Migration[6.1]
  def change
    create_table :room_rates do |t|
      t.integer :room_id, index: true
      t.integer :rate_type
      t.float :min_price, default: 0.0
      t.float :max_price, default: 0.0
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end

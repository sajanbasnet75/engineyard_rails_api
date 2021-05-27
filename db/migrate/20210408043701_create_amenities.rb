class CreateAmenities < ActiveRecord::Migration[6.1]
  def change
    create_table :amenities do |t|
      t.integer :room_id, index: true
      t.string :name
      t.string :description
      t.boolean :is_available, default: true

      t.timestamps
    end
  end
end

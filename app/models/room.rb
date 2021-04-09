# == Schema Information
#
# Table name: rooms
#
#  id             :bigint           not null, primary key
#  hotel_id       :integer
#  name           :string
#  description    :string
#  room_type      :integer
#  room_class     :integer
#  total_quantity :integer          default(0)
#  total_booked   :integer          default(0)
#  capacity       :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Room < ApplicationRecord
  belongs_to :hotel
  has_many :amenities, dependent: :destroy
  has_many :room_rates, dependent: :destroy
  accepts_nested_attributes_for :amenities, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :room_rates, allow_destroy: true, update_only: true

  # TODO: Decide Room types
  enum room_type: { single: 1,
                    double: 2 }
  # TODO: Decide Room class
  enum room_class: { high_class: 1,
                     low_class: 2 }
end

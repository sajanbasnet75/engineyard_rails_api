# frozen_string_literal: true

# Room Serializer
class RoomSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :room_type, :room_class, :total_quantity
  has_many :amenities
  has_many :room_rates
end

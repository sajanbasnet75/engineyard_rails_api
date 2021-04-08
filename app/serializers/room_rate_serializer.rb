# frozen_string_literal: true

# RoomRate Serializer
class RoomRateSerializer
  include JSONAPI::Serializer
  attributes :rate_type, :min_price, :max_price, :is_active
end

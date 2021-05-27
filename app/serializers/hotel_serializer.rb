# frozen_string_literal: true

# Hotel Serializer
class HotelSerializer
  include JSONAPI::Serializer
  attributes :name, :description
end

# frozen_string_literal: true

# Amenity Serializer
class AmenitySerializer
  include JSONAPI::Serializer
  attributes :name, :description, :is_available
end

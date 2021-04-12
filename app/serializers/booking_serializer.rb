# frozen_string_literal: true

# Booking Serializer
class BookingSerializer
  include JSONAPI::Serializer
  attributes :booked_check_in, :booked_check_out, :no_of_rooms, :no_of_adults,
             :no_of_child, :book_status, :booking_code, :arrival_date, :departure_date
  has_one :payment
  belongs_to :customer
  belongs_to :room
  belongs_to :room_rate
end

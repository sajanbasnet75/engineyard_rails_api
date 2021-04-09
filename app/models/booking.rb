# == Schema Information
#
# Table name: bookings
#
#  id               :bigint           not null, primary key
#  hotel_id         :integer
#  customer_id      :integer
#  room_id          :integer
#  room_rate_id     :integer
#  arrival_date     :string
#  departure_date   :string
#  booked_check_in  :string
#  booked_check_out :string
#  no_of_rooms      :integer
#  no_of_adults     :integer
#  no_of_child      :integer
#  reservation_type :integer
#  book_status      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Booking < ApplicationRecord
  belongs_to :hotel
  belongs_to :customer
  belongs_to :room
  belongs_to :room_rate
  validates :booked_check_in, :booked_check_out,
            :no_of_adults, :no_of_child,
            :reservation_type, 
            :book_status, 
            :total_rate, 
            presence: true

  # TODO: Decide Book types
  enum book_status: { reserved: 1,
                      confirmed: 2,
                     completed: 3,
                     cancelled: 4}
end

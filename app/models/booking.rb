# == Schema Information
#
# Table name: bookings
#
#  id               :bigint           not null, primary key
#  hotel_id         :integer
#  customer_id      :integer
#  arrival_date     :string
#  departure_date   :string
#  booked_check_in  :string
#  booked_check_out :string
#  no_of_rooms      :integer
#  no_of_adults     :integer
#  no_of_child      :integer
#  reservation_type :integer
#  book_status      :integer
#  total_rate       :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Booking < ApplicationRecord
end

# == Schema Information
#
# Table name: bookings
#
#  id               :bigint           not null, primary key
#  hotel_id         :integer
#  customer_id      :integer
#  room_id          :integer
#  room_rate_id     :integer
#  arrival_date     :datetime
#  departure_date   :datetime
#  booked_check_in  :datetime
#  booked_check_out :datetime
#  no_of_rooms      :integer
#  no_of_adults     :integer
#  no_of_child      :integer          default(0)
#  reservation_type :integer
#  book_status      :integer
#  booking_code     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Booking < ApplicationRecord
  belongs_to :hotel
  belongs_to :customer
  belongs_to :room
  belongs_to :room_rate
  has_one :payment
  accepts_nested_attributes_for :payment, update_only: true, reject_if: :all_blank
  validates :booked_check_in,
            :booked_check_out,
            :no_of_adults,
            :no_of_rooms,
            presence: true

  # TODO: Decide Book types
  enum book_status: { reserved: 1,
                      confirmed: 2,
                      completed: 3,
                      cancelled: 4 }

  after_create :generate_booking_code_and_invoice_id unless Rails.env.test?

  private 

  def generate_booking_code_and_invoice_id
    date = created_at.strftime('%m%y%d')
    booking_code = "SR" + id.to_s + date + customer_id.to_s
    update(booking_code: booking_code)

    invoice_id = payment.pay_type.upcase + payment.id.to_s + date + customer_id.to_s
    payment.update(invoice_no: invoice_id)
  end
end


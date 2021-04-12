# == Schema Information
#
# Table name: payments
#
#  id              :bigint           not null, primary key
#  booking_id      :integer
#  total_amt       :float
#  deposit_amt     :float
#  card_number     :string
#  card_exp_date   :date
#  invoice_id      :string
#  type            :integer
#  pay_status      :integer
#  billing_name    :string
#  billing_street  :string
#  billing_country :string
#  billing_state   :string
#  billing_city    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Payment < ApplicationRecord
  belongs_to :booking
  validates :total_amt, 
            :card_number,
            :card_exp_date,
            :billing_name,
            :billing_country,
            :billing_state,
            :billing_street,
            :billing_city,
            :pay_type,
            presence: true

  # TODO: Decide Payment Types
enum pay_type: { card: 1 }

# TODO: Decide Payment Status
enum pay_status: {paid: 1, unpaid: 2}
end

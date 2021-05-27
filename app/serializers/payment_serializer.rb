# frozen_string_literal: true

# Payment Serializer
class PaymentSerializer
  include JSONAPI::Serializer
  attributes :total_amt, :card_number, :card_exp_date, :invoice_id,
             :pay_type, :pay_status, :billing_name, :billing_country,
             :billing_state, :billing_street, :billing_city
end

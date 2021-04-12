FactoryBot.define do
  factory :payment do
    total_amt { 1.5 }
    deposit_amt { 1.5 }
    card_number { "MyString" }
    card_exp_date { "MyString" }
    invoice_id { "MyString" }
    type { 1 }
    pay_status { 1 }
  end
end

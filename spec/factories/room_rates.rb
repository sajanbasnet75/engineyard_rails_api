FactoryBot.define do
  factory :room_rate do
    rate_type { 1 }
    min_price { 1.5 }
    max_price { 1.5 }
  end
end

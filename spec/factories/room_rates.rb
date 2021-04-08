FactoryBot.define do
  factory :room_rate do
    rate_type { 1 }
    min_price { 10000 }
    max_price { 1000 }
    is_active {true}
  end
end

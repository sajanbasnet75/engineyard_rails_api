FactoryBot.define do
  factory :room do
    name { 'Room101' }
    description { 'guest room,  awesome room' }
    room_type { 1 }
    room_class { 1 }
    total_quantity { 1 }
    capacity { 5 }
  end
end

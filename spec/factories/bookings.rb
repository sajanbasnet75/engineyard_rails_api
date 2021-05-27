FactoryBot.define do
  factory :booking do
    arrival_date { Date.today }
    departure_date { Date.tomorrow }
    booked_check_in { Date.today }
    booked_check_out { Date.tomorrow }
    no_of_rooms { 1 }
    no_of_adults { 1 }
    no_of_child { 1 }
    reservation_type { 1 }
    book_status { 1 }
  end
end

FactoryBot.define do
  factory :booking do
    arrival_date { "MyString" }
    departure_date { "MyString" }
    booked_check_in { "MyString" }
    booked_check_out { "MyString" }
    no_of_rooms { 1 }
    no_of_adults { 1 }
    no_of_child { 1 }
    reservation_type { 1 }
    book_status { 1 }
  end
end

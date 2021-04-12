require 'spec_helper'
require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Api::V1::BookingsController, type: :api do
  let!(:hotel) { FactoryBot.create(:hotel) }
  let!(:customer) { FactoryBot.create(:customer) }
  let!(:room) { FactoryBot.create(:room, hotel: hotel) }
  let!(:amenity) { FactoryBot.create(:amenity, room: room) }
  let!(:room_rate) { FactoryBot.create(:room_rate, room: room) }

  resource 'Create new bookings' do
    header 'Content-Type', 'application/json'
    post '/api/v1/bookings' do
      parameter :hotel_id, 'Hotel id', required: true
      parameter :room_id, 'Booked room id', required: true
      parameter :room_rate_id, 'Selected rates', required: true
      parameter :booked_check_in, 'Booked check in date', required: true
      parameter :booked_check_out, 'Booked check out date', required: true
      parameter :no_of_rooms, 'No of rooms', required: true
      parameter :no_of_child, 'No of child', required: true
      parameter :no_of_adults, 'No of adults', required: true
      parameter :total_amt, 'Total amount of bookings', scope: %i[booking payment_attributes], required: true
      parameter :card_number, 'Credit Card Number', scope: %i[booking payment_attributes], required: true
      parameter :pay_type, 'what is used to pay? can be card: 1', scope: %i[booking payment_attributes], required: true
      parameter :total_amt, 'Total amount of bookings', scope: %i[booking payment_attributes], required: true
      parameter :card_exp_date, 'Expiry date of card', scope: %i[booking payment_attributes], required: true
      parameter :billing_street, 'Billing street', scope: %i[booking payment_attributes], required: true
      parameter :billing_country, 'Billing counntry', scope: %i[booking payment_attributes], required: true
      parameter :billing_city, 'Billing city', scope: %i[booking payment_attributes], required: true
      parameter :billing_state, 'Billing state', scope: %i[booking payment_attributes], required: true

      let(:raw_post) { params.to_json }
      example 'Creates a booking of the room successfully' do
        # total_room = hotel.rooms.count
        request = {
          booking: {
            hotel_id: hotel.id,
            room_id: room.id,
            room_rate_id: room_rate.id,
            booked_check_in: Date.today,
            booked_check_out: Date.tomorrow,
            no_of_child: 1,
            no_of_adults: 2,
            no_of_rooms: 1,
            payment_attributes: {
              total_amt: 1000.00,
              card_number: '4242424242424242',
              card_exp_date: Date.tomorrow,
              pay_type: 'card',
              pay_status: 'paid',
              billing_name: 'Ram bahadur',
              billing_country: 'Nepal',
              billing_city:'Pokhara',
              billing_state: 'Kapan',
              billing_street: '101 gau'
            }
          }
        }
        token = JsonWebToken.encode(customer_id: customer.id, password: customer.password)
        header 'Authorization', token
        do_request(request)
        # expect(Room.count).to eq(total_room + 1)
        expect(status).to eq(200)
      end
    end
  end
end


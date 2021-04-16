# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Api::V1::RoomsController, type: :api do
  let!(:hotel) { FactoryBot.create(:hotel) }
  let!(:customer) { FactoryBot.create(:customer) }
  let!(:room) { FactoryBot.create(:room, hotel: hotel) }
  let!(:amenity) { FactoryBot.create(:amenity, room: room) }
  let!(:room_rate) { FactoryBot.create(:room_rate, room: room) }

  resource 'Customer App: 3. Rooms list' do
    header 'Content-Type', 'application/json'
    get '/api/v1/rooms' do
      context 'Customer views the room list' do
        example 'Gets all the list of rooms' do
          room.amenities << amenity
          room.room_rates << room_rate
          token = JsonWebToken.encode(customer_id: customer.id, password: customer.password)
          header 'Authorization', token
          do_request(hotel_id: hotel.id)
          expect(status).to eq(200)
        end
      end
    end
  end

  resource 'Customer App: 4. Room Details' do
    header 'Content-Type', 'application/json'
    get '/api/v1/rooms/:id' do
      context 'Customer views the details of room' do
        example 'gets the details of a room' do
          token = JsonWebToken.encode(customer_id: customer.id, password: customer.password)
          header 'Authorization', token
          do_request(id: room.id, hotel_id: hotel.id)
          expect(status).to eq(200)
        end
      end
    end
  end

  resource 'Admin: Create new Room for a hotel' do
    header 'Content-Type', 'application/json'
    post '/api/v1/rooms' do
      parameter :hotel_id, 'Hotel id for which the room is added', required: true
      parameter :name, 'name of room', required: true
      parameter :description, 'Description of room', required: true
      parameter :room_type, 'can be Single Double Deluxe Guest', required: true
      parameter :room_class, 'can be High Low', required: true
      parameter :total_quantity, 'greater than 1', required: true
      parameter :name, 'Amenities name', scope: %i[room amenities_attributes]
      parameter :description, 'Amenities description', scope: %i[room amenities_attributes 0], required: true
      parameter :is_available, 'Amenities available? true or false', scope: %i[room amenities_attributes 0]
      parameter :rate_type, 'can be standart rate, premium rate', scope: %i[room room_rates_attributes 0],
                                                                  required: true
      parameter :min_price, 'min price of room',  scope: %i[room room_rates_attributes 0], required: true
      parameter :max_price, 'max price of room',  scope: %i[room room_rates_attributes 0], required: true
      parameter :is_active, 'rate active or not? can be true or false', scope: %i[room room_rates_attributes 0],
                                                                        required: true

      let(:raw_post) { params.to_json }
      example 'Creates a new room for the hotel successfully' do
        total_room = hotel.rooms.count
        request = {
          hotel_id: hotel.id,
          room: {
            name: 'Room 101',
            description: 'description of room',
            room_type: 1,
            room_class: 2,
            total_quantity: 10,
            amenities_attributes: {
              '0': { name: 'Towel',
                     description: 'Soft towel for wiping your',
                     is_available: true },
              '1': { name: 'TV',
                     description: 'Netflix and chill',
                     is_available: true }
            },
            room_rates_attributes: {
              '0': { rate_type: 1,
                     max_price: 30_000,
                     min_price: 20_000,
                     is_active: true },
              '1': { rate_type: 2,
                     max_price: 50_000,
                     min_price: 30_000,
                     is_active: true }
            }
          }
        }
        do_request(request)
        expect(Room.count).to eq(total_room + 1)
        expect(status).to eq(200)
      end
    end
  end
end

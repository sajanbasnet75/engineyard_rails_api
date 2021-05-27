# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Api::V1::HotelsController, type: :api do
  let!(:admin) { FactoryBot.create(:admin) }
  resource 'Admin: Create new Hotel' do
    header 'Content-Type', 'application/json'
    post '/api/v1/hotels' do
      parameter :name, 'Name of hotel', required: true
      parameter :description, 'Description of hotel', required: true

      let(:raw_post) { params.to_json }
      example 'Creates a new hotel successfully' do
        total_hotel = Hotel.count
        token = JsonWebToken.encode(admin_id: admin.id, password: admin.password)
        header 'Authorization', token
        request = {
          hotel: {
            name: 'Sunseeker Resort',
            description: 'this is an awesome place'
          }
        }
        do_request(request)
        expect(Hotel.count).to eq(total_hotel + 1)
        expect(status).to eq(200)
      end

      example 'Cant create hotel without name' do
        token = JsonWebToken.encode(admin_id: admin.id, password: admin.password)
        header 'Authorization', token
        request = {
          hotel: {
            description: 'this is awesome place'
          }
        }
        do_request(request)
        expect(status).to eq(422)
      end
    end
  end
end

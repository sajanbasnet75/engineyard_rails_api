# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Api::V1::SessionsController, type: :api do
  let!(:customer) { FactoryBot.create(:customer) }
  resource 'Login for Customers' do
    header 'Content-Type', 'application/json'
    post '/api/v1/customer_login' do
      parameter :email, 'Customers email ', required: true
      parameter :password, 'Customers password', required: true

      let(:raw_post) { params.to_json }
      example 'Customer successfully logs in' do
        request = {
          customer: {
            email: customer.email,
            password: customer.password
          }
        }
        do_request(request)
        expect(status).to eq(200)
      end

      example 'Customer cant login with invalid credentials' do
        request = {
          customer: {
            email: customer.email,
            password: '123'
          }
        }
        do_request(request)
        expect(status).to eq(401)
      end
    end
  end
end

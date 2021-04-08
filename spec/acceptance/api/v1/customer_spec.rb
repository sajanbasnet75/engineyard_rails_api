# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Api::V1::CustomersController, type: :api do
  let!(:customer) { FactoryBot.create(:customer) }


  resource 'Create new customer' do
    header 'Content-Type', 'application/json'
    post '/api/v1/customers' do
      parameter :first_name, 'First name of customer', required: true
      parameter :last_name, 'Last name of customer', required: true
      parameter :title, 'Mr, Mrs', required: true
      parameter :email, required: true
      parameter :password, required: true
      parameter :phone, 'countrycode-number', required: true
      parameter :dob, 'Date of birth', required: true
      parameter :gender, 'male, female, other', required: true

      let(:raw_post) { params.to_json }
      example 'Creates a new customer successfully' do
        total_customer = Customer.count
        request = {
          customer: {
            first_name: 'Sajan',
            last_name: 'Basnet',
            title: 'Mr',
            email: 'saja@gurzu.com',
            phone: '977-9843773129',
            password: 'password',
            dob: Date.today,
            gender: 'Male',
          }
        }
        do_request(request)
        expect(Customer.count).to eq(total_customer + 1)
        expect(status).to eq(200)
      end

      example 'Cant create customer without email' do
        request = {
          customer: {
            first_name: 'Sajan',
            last_name: 'Sajan',
            dob: Date.today,
            gender: 'Male',
            type: 'Customer',
            password: 'password'
          }
        }
        do_request(request)
        expect(status).to eq(422)
      end
    end
  end
end
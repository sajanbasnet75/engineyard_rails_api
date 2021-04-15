# frozen_string_literal: true

module Api
  module V1
    # Customer Class
    class CustomersController < Api::V1::BaseController
      before_action :authorize_request!, except: %i[create]

      # POST /api/v1/customers
      def create
        customer = Customer.new(customer_create_params)

        if customer.save
          token = JsonWebToken.encode(customer_id: customer.id, customer: customer.password)
          render jsonapi: customer, params: { auth_token: token },
                 code: '200', status: :ok
        else
          render jsonapi_errors: customer.errors,
                 code: '422', status: :unprocessable_entity
        end
      end

      private

      def customer_create_params
        params.require(:customer).permit(:first_name, :last_name, :title, :email, :password, :phone, :dob, :gender)
      end
    end
  end
end

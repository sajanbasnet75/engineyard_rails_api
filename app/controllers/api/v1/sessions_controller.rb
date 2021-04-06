# frozen_string_literal: true

module Api
  module V1
    # sessions controller
    class SessionsController < Api::V1::BaseController

      # POST /api/v1/custoemr_login
      def customer_login
        customer = Customer.find_for_authentication(email: login_params[:email])
        if customer.present? && customer.valid_password?(login_params[:password])
          render json: customer,
                 status: :ok, code: '200'
        else
          render json: [{ title: 'Invalid Email or Password' }],
                 code: '401', status: :unauthorized
        end
      end

      private

      def login_params
        params.require(:user).permit(:email, :password)
      end

    end
  end
end
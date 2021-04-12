# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include ExceptionHandler

      def authorize_request!
        @decoded = JsonWebToken.decode(auth_token).deep_symbolize_keys
        @current_customer = Customer.find(@decoded[:customer_id])
      rescue JWT::ExpiredSignature
        render jsonapi_errors: [{ title: e.message }], code: '401', status: :unauthorized
      rescue JWT::DecodeError => e
        render jsonapi_errors: [{ title: e.message }], code: '401', status: :unauthorized
      end

      def auth_token
        @auth_token ||= request.headers.fetch('Authorization', '').split(' ').last
      end
    end
  end
end

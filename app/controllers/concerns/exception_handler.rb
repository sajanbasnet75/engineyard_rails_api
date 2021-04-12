# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end

  included do 
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
  end

  private

  def unauthorized_request
    render jsonapi_errors: [{title: 'Invalid Authentication'}], 
           code: '401',
           status: :unauthorized
  end
end
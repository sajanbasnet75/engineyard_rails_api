# frozen_string_literal: true

# Cutomer Serializer
class CustomerSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :phone, :gender, :dob

  attribute :auth_token do |_customer, params|
    params[:auth_token]
  end
end

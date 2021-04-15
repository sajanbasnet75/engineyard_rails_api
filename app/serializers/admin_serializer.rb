# frozen_string_literal: true

class AdminSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :phone

  attribute :auth_token do |_admin, params|
    params[:auth_token]
  end
end

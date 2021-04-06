class CustomerSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :phone, :gender, :dob
end

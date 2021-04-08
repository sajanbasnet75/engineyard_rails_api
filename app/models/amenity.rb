# == Schema Information
#
# Table name: amenities
#
#  id           :bigint           not null, primary key
#  room_id      :integer
#  name         :string
#  description  :string
#  is_available :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Amenity < ApplicationRecord
end

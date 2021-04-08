# == Schema Information
#
# Table name: rooms
#
#  id                :bigint           not null, primary key
#  hotel_id          :integer
#  name              :string
#  description       :string
#  room_type         :integer
#  room_class        :integer
#  total_quantity    :integer
#  available_quantiy :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Room < ApplicationRecord
end

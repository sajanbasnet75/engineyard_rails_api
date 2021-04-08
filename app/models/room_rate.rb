# == Schema Information
#
# Table name: room_rates
#
#  id         :bigint           not null, primary key
#  rate_type  :integer
#  min_price  :float            default(0.0)
#  max_price  :float            default(0.0)
#  is_active  :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RoomRate < ApplicationRecord
end

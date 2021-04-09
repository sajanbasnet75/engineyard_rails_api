# == Schema Information
#
# Table name: room_rates
#
#  id         :bigint           not null, primary key
#  room_id    :integer
#  rate_type  :integer
#  min_price  :float            default(0.0)
#  max_price  :float            default(0.0)
#  is_active  :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RoomRate < ApplicationRecord
  belongs_to :room
  
    # TODO Decide Room rates
    enum rate_type: {standard: 1,
                     premium: 2
                    }
end

# == Schema Information
#
# Table name: hotels
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Hotel < ApplicationRecord
  validates :name, :description, presence: true
  has_many :rooms, dependent: :destroy
  has_many_attached :images
end

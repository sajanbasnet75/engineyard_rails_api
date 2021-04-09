# == Schema Information
#
# Table name: customers
#
#  id                 :bigint           not null, primary key
#  first_name         :string           default(""), not null
#  last_name          :string           default(""), not null
#  title              :string
#  phone              :string
#  dob                :date
#  gender             :string
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
  validates :first_name, :last_name, presence: true
end

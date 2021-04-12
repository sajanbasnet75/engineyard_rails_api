require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:booked_check_in) }
    it { should validate_presence_of(:booked_check_out) }
    it { should validate_presence_of(:no_of_adults) }
    it { should validate_presence_of(:no_of_rooms) }
  end
end

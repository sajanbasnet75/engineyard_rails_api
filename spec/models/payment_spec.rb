require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:total_amt) }
    it { should validate_presence_of(:card_number) }
    it { should validate_presence_of(:card_exp_date) }
    it { should validate_presence_of(:billing_name) }
    it { should validate_presence_of(:billing_country) }
    it { should validate_presence_of(:billing_state) }
    it { should validate_presence_of(:billing_street) }
    it { should validate_presence_of(:billing_city) }
  end
end

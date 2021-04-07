FactoryBot.define do
  factory :customer do
    first_name {'Sajan'}
    last_name {'Basnet'}
    gender {'Male'}
    title { 'Mr' }
    dob {'2000-09-09 13:27:56' }
    email {'sajan@gurzu.com'}
    password {'password'}
  end
end
FactoryGirl.define do
  factory :subscriber do
    email { Faker::Internet.email}
    try_date Time.new
  end
end

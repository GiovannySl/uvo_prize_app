FactoryGirl.define do

  factory :prize do
    title { Faker::Commerce.product_name }
    description { Faker::Commerce.material }
    existences { Faker::Number.number(2) }
    active true
  end
end

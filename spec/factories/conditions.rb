FactoryGirl.define do
  factory :condition do
    after_num Faker::Number.between(1,99)
    number Faker::Number.number(2)
    condition_type ["S", "M"][Faker::Number.between(0,1)]
    active true
  end
end
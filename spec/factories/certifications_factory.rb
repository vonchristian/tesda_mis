FactoryGirl.define do
  factory :certification do
    certified_id nil
    certified_type nil
    number { Faker::Number.number(12) }
  end
end

FactoryGirl.define do
  factory :institution do
    name { Faker::Name.first_name }
  end
end

FactoryGirl.define do
  factory :client do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.last_name }
    last_name { Faker::Name.last_name }
    sex 'male'
    date_of_birth Date.today.years_ago(20)
  end
end

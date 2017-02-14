FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{}person#{n}@example.com" }
    password 'secret12345'
    password_confirmation 'secret12345'
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.last_name }
    last_name { Faker::Name.last_name }
    designation 'tesda_specialist_ii'
  end
end

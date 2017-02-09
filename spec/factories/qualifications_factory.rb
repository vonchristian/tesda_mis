FactoryGirl.define do 
  factory :qualification do 
    name { Faker::Name.first_name }
    sector nil
  end 
end 
FactoryGirl.define do
  factory :region, class: "Addresses::Region" do
    name { Faker::Name.first_name }
  end
end

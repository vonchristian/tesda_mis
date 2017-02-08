FactoryGirl.define do
  factory :barangay, class: "Addresses::Barangay" do
    name { Faker::Name.first_name }
    municipality_or_city nil
  end
end

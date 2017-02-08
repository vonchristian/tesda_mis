FactoryGirl.define do
  factory :province, class: "Addresses::Province" do
    name { Faker::Name.first_name }
    region nil
  end
end

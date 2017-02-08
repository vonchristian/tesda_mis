FactoryGirl.define do
  factory :municipality_or_city, class: "Addresses::MunicipalityOrCity" do
    name { Faker::Name.first_name }
    province nil
  end
end

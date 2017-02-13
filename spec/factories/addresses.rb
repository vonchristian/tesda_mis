FactoryGirl.define do
  factory :address do
    province nil
    municipality_or_city nil
    barangay nil
    addressable_id 1
    addressable_type 1
    street { Faker::Address.street }
  end
end

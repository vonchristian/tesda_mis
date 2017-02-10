FactoryGirl.define do 
  factory :modality, class: "Configurations::Modality" do 
    name { Faker::Business.name }
  end 
end 
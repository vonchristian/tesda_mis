FactoryGirl.define do 
  factory :educational_attainment, class: "Configurations::EducationalAttainment" do 
    name { Faker::Name.last_name }
  end 
end 
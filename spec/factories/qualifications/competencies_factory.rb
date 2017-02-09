FactoryGirl.define do 
  factory :competency, class: "Qualifications::Competency" do 
    unit_title { Faker::Name.first_name }
    qualification
  end 
end 
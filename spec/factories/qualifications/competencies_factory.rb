FactoryGirl.define do
  factory :competency, class: "Qualifications::Competency" do
    qualification nil
    unit_code "MyString"
    unit_title "MyString"
  end
end

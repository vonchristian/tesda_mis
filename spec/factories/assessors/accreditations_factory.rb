FactoryGirl.define do
  factory :accreditation, class: "Assessors::Accreditation" do
    qualification nil
    assessor nil
    number "MyString"
  end
end

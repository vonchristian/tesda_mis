FactoryGirl.define do 
  factory :assessment do 
    assessor 
    assessee_id nil 
    assessee_type nil 
    result "competent"
    assessment_center
  end
end
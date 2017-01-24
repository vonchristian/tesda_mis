FactoryGirl.define do
  factory :certificate, class: "Assessments::Certificate" do
    type ""
    trainee nil
    date_issued "2017-01-23 21:51:29"
    expiry_date "2017-01-23 21:51:29"
    number "MyString"
  end
end

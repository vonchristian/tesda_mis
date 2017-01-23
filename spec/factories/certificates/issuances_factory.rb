FactoryGirl.define do
  factory :issuance, class: "Certificates::Issuance" do
    certificate nil
    serial_number "MyString"
    application_date "2017-01-24"
    claim_date "2017-01-24"
  end
end

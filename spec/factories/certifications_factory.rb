FactoryGirl.define do
  factory :certification do
    certified_id nil
    certified_type nil
    number { Faker::Number.number(12) }
    issue_date Date.today
    expiry_date Date.today.next_year(5)

    factory :national_certificate, class: "Certifications::NationalCertificate" do 
      type "Certifications::NationalCertificate"
    end
  end
end

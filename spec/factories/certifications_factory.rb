FactoryGirl.define do
  factory :certification do
    certified_id nil
    certified_type nil
    number { Faker::Number.number(12) }

    factory :national_certificate, class: "Certifications::NationalCertificate" do 
      type "Certifications::NationalCertificate"
    end
  end
end

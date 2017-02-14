FactoryGirl.define do
  factory :signatory, class: "Configurations::Signatory" do
    first_name    { Faker::Name.first_name }
    middle_name   { Faker::Name.last_name }
    last_name     { Faker::Name.last_name }
    designation "Director General"
    term_start_date "2017-02-14 21:56:53"
    term_end_date "2017-02-14 21:56:53"
  end
end

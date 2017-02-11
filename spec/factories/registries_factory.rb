FactoryGirl.define do
  factory :registry do
    name { Faker::Name.first_name }
    spreadsheet File.new("#{Rails.root}/spec/support/spreadsheets/test_rwac.xls")
    date Date.today
  end
end

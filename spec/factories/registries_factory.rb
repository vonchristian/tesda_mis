FactoryGirl.define do
  factory :registry do
    name { Faker::Name.first_name }
    spreadsheet File.new("#{Rails.root}/spec/support/spreadsheets/test_rwac.xls")
    date Date.today
    factory :worker_registry do 
      type "Registries::WorkerRegistry"
    end
    factory :assessor_registry do 
      type "Registries::AssessorRegistry"
    end
  end
end

FactoryGirl.define do 
  factory :completed_training, class: "Clients::CompletedTraining" do 
    client 
    training 
    region 
    province 
    reference_number { Faker::Number.number(11) }
    modality 
    client_type
  end
end
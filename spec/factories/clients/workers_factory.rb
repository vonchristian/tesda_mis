FactoryGirl.define do
  factory :worker, class: "Clients::Worker" do
    client nil
  end
end

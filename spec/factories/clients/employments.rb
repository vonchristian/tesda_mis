FactoryGirl.define do
  factory :employment, class: "Clients::Employment" do
    designation "MyString"
    company nil
    assessor nil
  end
end

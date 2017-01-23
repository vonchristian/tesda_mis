FactoryGirl.define do
  factory :province, class: "Regions::Province" do
    name "MyString"
    region nil
  end
end

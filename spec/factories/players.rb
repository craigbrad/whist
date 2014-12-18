FactoryGirl.define do
  factory :player do
    first_name { Faker::Name.first_name }
  end
end
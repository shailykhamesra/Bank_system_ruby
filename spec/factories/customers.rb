FactoryGirl.define do
  factory :customer do
    name Faker::Name.name
    address Faker::Address.city
    phone Faker::PhoneNumber.phone_number
    association :bank, factory: :bank, strategy: :build
  end
end

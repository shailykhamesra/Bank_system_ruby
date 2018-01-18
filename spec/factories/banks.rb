FactoryGirl.define do
  factory :bank do
    name Faker::Name.name
    address Faker::Address.city
    phone Faker::PhoneNumber.phone_number
  end
end

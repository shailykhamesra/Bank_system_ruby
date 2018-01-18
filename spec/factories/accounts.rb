FactoryGirl.define do
  factory :account do
    account_no Faker::Number.number(8)
    balance Faker::Number.positive(8)
    association :customer, factory: :customer, strategy: :build
  end
end

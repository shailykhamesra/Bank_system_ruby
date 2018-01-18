FactoryGirl.define do
  factory :locker do
    locker_key Faker::Number.number(4)
    association :account, factory: :account, strategy: :build
  end
end

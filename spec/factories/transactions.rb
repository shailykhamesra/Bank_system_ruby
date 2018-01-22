FactoryGirl.define do
  factory :transaction do
    account_type ''
    association :account, factory: :account, strategy: :build
  end
end

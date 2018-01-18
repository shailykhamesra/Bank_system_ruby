FactoryGirl.define do
  factory :loan do
    loan_type ""
    association :account, factory: :account, strategy: :build
  end
end

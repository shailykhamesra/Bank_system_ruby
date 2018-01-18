class Transaction < ApplicationRecord
  enum account_type: [:withdrawl, :deposit]
  belongs_to :account
end

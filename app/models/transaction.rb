class Transaction < ApplicationRecord
  enum account_type: %i[withdrawl deposit]
  belongs_to :account
end

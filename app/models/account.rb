class Account < ApplicationRecord
  belongs_to :customer
  has_many :loans
  has_many :lockers
  has_many :transactions
  validates :account_no, presence: true, length: { minimum: 4}
  validates :balance, presence: true
end

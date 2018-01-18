class Loan < ApplicationRecord
  enum loan_type: [:education, :home_loan]
  belongs_to :account
end

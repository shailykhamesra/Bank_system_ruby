class Loan < ApplicationRecord
  enum loan_type: %i[education home_loan]
  belongs_to :account
end

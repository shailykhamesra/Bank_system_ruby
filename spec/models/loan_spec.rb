require 'rails_helper'
RSpec.describe Loan, type: :model do
  context 'successfull validation and association' do
    it 'should be valid with a loan_type' do 
  	  FactoryGirl.build(:loan  ).should be_valid
    end
    it 'should belongs to account' do
      account= FactoryGirl.create(:account)
      loan = FactoryGirl.create(:loan , account_id: account.id)
      loan.account_id.should eq account.id
    end
  end
  context 'failure in validation and association' do
    it 'should not be valid with a loan_type' do 
      FactoryGirl.build(:loan).should be_valid
    end
    it 'should not belongs to account' do
      account1= FactoryGirl.create(:account)
      account2= FactoryGirl.create(:account)
      loan = FactoryGirl.create(:loan , account_id: account1.id)
      loan.account_id.should eq account1.id
    end
  end
end

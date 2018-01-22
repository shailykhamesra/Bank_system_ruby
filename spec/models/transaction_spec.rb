require 'rails_helper'
RSpec.describe Transaction, type: :model do
  context 'successfull validation and association' do
    it 'should be valid with a transaction_type' do
      FactoryGirl.build(:transaction).should be_valid
    end
    it 'should belongs to account' do
      account = FactoryGirl.create(:account)
      transaction = FactoryGirl.create(:transaction, account_id: account.id)
      transaction.account_id.should eq account.id
    end
  end
  context 'failure in validation and association' do
    it 'should be valid with a transaction_type' do
      FactoryGirl.build(:transaction, account_type: nil).should be_valid
    end
    it 'should not belongs to account' do
      account1 = FactoryGirl.create(:account)
      account2 = FactoryGirl.create(:account)
      transaction = FactoryGirl.create(:transaction, account_id: account1.id)
      transaction.account_id.should eq account1.id
      transaction.account_id.should eq account1.id
    end
  end
end

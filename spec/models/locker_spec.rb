require 'rails_helper'
RSpec.describe Locker, type: :model do
  context 'successfull validation and association' do
    it 'should be valid with a locker_key' do
      FactoryGirl.build(:locker).should be_valid
    end
    it 'should belongs to account' do
      account = FactoryGirl.create(:account)
      locker = FactoryGirl.create(:locker, account_id: account.id)
      locker.account_id.should eq account.id
    end
  end
  context 'failure validation and association' do
    it 'should not be valid with a locker_key' do
      FactoryGirl.build(:locker, locker_key: nil).should_not be_valid
    end
    it 'should not belongs to account' do
      account1 = FactoryGirl.create(:account)
      account2 = FactoryGirl.create(:account)
      locker = FactoryGirl.create(:locker, account_id: account1.id)
      locker.account_id.should eq account1.id
    end
  end
end

require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'success validation and association test' do
    it 'should be valid with a account_no' do 
  	  FactoryGirl.build(:account).should be_valid
    end
    it 'should be valid with a balance' do 
      FactoryGirl.build(:account).should be_valid
    end
    it 'should be valid with a minimum length of account_no' do 
      FactoryGirl.build(:account).should be_valid
    end
    it 'should be valid with a minimum length of balance' do 
      FactoryGirl.build(:account).should be_valid
    end
    it 'should have many loans' do
      account = FactoryGirl.create(:account)
      loan1 = FactoryGirl.create(:loan, account_id: account.id)
      loan2 = FactoryGirl.create(:loan, account_id: account.id)
      loan3 = FactoryGirl.create(:loan, account_id: account.id)
      loan1.account.id.should eq account.id and loan2.account.id.should eq account.id and loan3.account.id.should eq account.id
    end  
    it 'should have many lockers' do
      account = FactoryGirl.create(:account)
      locker1 = FactoryGirl.create(:locker, account_id: account.id)
      locker2 = FactoryGirl.create(:locker, account_id: account.id)
      locker3 = FactoryGirl.create(:locker, account_id: account.id)
      locker1.account.id.should eq account.id and locker2.account.id.should eq account.id and locker3.account.id.should eq account.id
    end  
    it 'should have many transactions' do
      account = FactoryGirl.create(:account)
      transaction1 = FactoryGirl.create(:transaction, account_id: account.id)
      transaction2 = FactoryGirl.create(:transaction, account_id: account.id)
      transaction3 = FactoryGirl.create(:transaction, account_id: account.id)
      transaction1.account.id.should eq account.id and transaction2.account.id.should eq account.id and transaction3.account.id.should eq account.id
    end 
    it 'should belongs to customer' do
     customer= FactoryGirl.create(:customer)
     account = FactoryGirl.create(:account ,customer_id: customer.id)
     account.customer_id.should eq customer.id
    end
  end  
  context 'failure validation and association test' do
    it 'is invalid without a name' do 
      FactoryGirl.build(:account, account_no: nil).should_not be_valid 
    end
    it 'is invalid without a address' do 
      FactoryGirl.build(:account, balance: nil).should_not be_valid  
    end
    it 'should belongs to customer' do
     customer1= FactoryGirl.create(:customer)
     account = FactoryGirl.create(:account ,customer_id: customer1.id)
     account.customer_id.should eq customer1.id
    end
    it 'should not have many loans' do
      account1 = FactoryGirl.create(:account)
      account2 = FactoryGirl.create(:account)
      loan1 = FactoryGirl.create(:loan, account_id: account1.id)
      loan2 = FactoryGirl.create(:loan, account_id: account2.id)
      loan1.account_id.should_not eq account2.id 
      loan2.account_id.should_not eq account1.id  
    end  
    it 'should not have many lockers' do
      account1 = FactoryGirl.create(:account)
      account2 = FactoryGirl.create(:account)
      locker1 = FactoryGirl.create(:locker, account_id: account1.id)
      locker2 = FactoryGirl.create(:locker, account_id: account2.id)
      locker1.account.id.should_not eq account2.id 
      locker2.account.id.should_not eq account1.id 
    end  
    it 'should not have many transactions' do
      account1 = FactoryGirl.create(:account)
      account2 = FactoryGirl.create(:account)
      transaction1 = FactoryGirl.create(:transaction, account_id: account1.id)
      transaction2 = FactoryGirl.create(:transaction, account_id: account2.id)
      transaction1.account.id.should_not eq account2.id 
      transaction2.account.id.should_not eq account1.id 
    end 
  end 
end


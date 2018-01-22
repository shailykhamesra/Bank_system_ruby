require 'rails_helper'
RSpec.describe Customer, type: :model do
  context 'success validation and association test' do
    it 'should be valid with a name' do
      FactoryGirl.build(:customer).should be_valid
    end
    it 'should be valid with a address' do
      FactoryGirl.build(:customer).should be_valid
    end
    it 'should be valid with a phone number' do
      FactoryGirl.build(:customer).should be_valid
    end
    it 'should belongs to bank' do
      bank = FactoryGirl.create(:bank)
      customer = FactoryGirl.create(:customer, bank_id: bank.id)
      customer.bank_id.should eq bank.id
    end
    it 'should have many account' do
      customer = FactoryGirl.create(:customer)
      account1 = FactoryGirl.create(:account, customer_id: customer.id)
      account2 = FactoryGirl.create(:account, customer_id: customer.id)
      account3 = FactoryGirl.create(:account, customer_id: customer.id)
      account1.customer.id.should(eq customer.id) && account2.customer.id.should(eq customer.id) && account3.customer.id.should(eq customer.id)
    end
  end
  context 'failure validation and association test' do
    it 'is invalid without a name' do
      FactoryGirl.build(:customer, name: nil).should_not be_valid
    end
    it 'is invalid without a address' do
      FactoryGirl.build(:customer, address: nil).should_not be_valid
    end
    it 'is invalid without a phone_no' do
      FactoryGirl.build(:customer, phone: nil).should_not be_valid
    end
    it 'should not belongs to bank' do
      bank1 = FactoryGirl.create(:bank)
      customer = FactoryGirl.create(:customer, bank_id: bank1.id)
      customer.bank_id.should eq bank1.id
    end
    it 'should have many account' do
      customer1 = FactoryGirl.create(:customer)
      customer2 = FactoryGirl.create(:customer)
      account1 = FactoryGirl.create(:account, customer_id: customer1.id)
      account2 = FactoryGirl.create(:account, customer_id: customer2.id)
      account1.customer_id.should_not eq customer2.id
      account2.customer_id.should_not eq customer1.id
    end
  end
end

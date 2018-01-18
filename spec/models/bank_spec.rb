require 'rails_helper'
RSpec.describe Bank, type: :model do
  context 'failure in validation test and association' do
    it 'is invalid without a name' do 
  	  FactoryGirl.build(:bank, name: nil).should_not be_valid	
    end
    it 'is invalid without a address' do 
  	  FactoryGirl.build(:bank, address: nil).should_not be_valid	
    end
    it 'is invalid without a phone' do 
  	  FactoryGirl.build(:bank, address: nil).should_not be_valid	
    end
    it 'should not have many customers' do
      bank1 = FactoryGirl.create(:bank)
      bank2 = FactoryGirl.create(:bank)
      customer1 = FactoryGirl.create(:customer, bank_id: bank1.id)
      customer2 = FactoryGirl.create(:customer, bank_id: bank2.id)
      customer1.bank_id.should_not eq bank2.id 
      customer2.bank_id.should_not eq bank1.id
      customer2.bank_id.should eq bank2.id 
    end  
  end
  context 'successfull validation test and associations' do
    it 'is valid with a name' do 
  	  FactoryGirl.build(:bank).should be_valid
    end
    it 'is valid with a address' do 
      FactoryGirl.build(:bank).should be_valid
    end
    it 'is valid with a phone' do 
      FactoryGirl.build(:bank).should be_valid
    end
    it 'should have many customers' do
      bank = FactoryGirl.create(:bank)
      customer1 = FactoryGirl.create(:customer, bank_id: bank.id)
      customer2 = FactoryGirl.create(:customer, bank_id: bank.id)
      customer3 = FactoryGirl.create(:customer, bank_id: bank.id)
      customer1.bank.id.should eq bank.id and customer2.bank.id.should eq bank.id and customer3.bank.id.should eq bank.id
    end  
  end
end
require 'rails_helper'
RSpec.describe CustomersController, type: :controller do
  context 'GET index' do
    it 'should show all customers successfully' do
      customer1 = FactoryGirl.create(:customer)
      customer2 = FactoryGirl.create(:customer)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show customers with given id successfully' do
      customer = FactoryGirl.create(:customer)
      get :show, params: { id: customer.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid customers' do
      customer = FactoryGirl.create(:customer)
      get :show, params: { id: '' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid customer creation' do
      bank = FactoryGirl.create(:bank)
      post :create, params: { customer: { name: Faker::Name.name, address: Faker::Address.city, phone: Faker::PhoneNumber.phone_number, bank_id: bank.id } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not create a customer with invalid input' do
      post :create, params: { customer: { name: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not create a customers with nil entries' do
      customer = FactoryGirl.create(:customer)
      post :create, params: { customer: { name: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not create a customers with nil entries' do
      customer = FactoryGirl.create(:customer)
      post :create, params: { customer: { address: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not create a customers with nil entries' do
      customer = FactoryGirl.create(:customer)
      post :create, params: { customer: { phone: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid customer updation' do
      customer = FactoryGirl.create(:customer)
      put :update, params: { id: customer.id, customer: { name: 'a', address: 'abcd', phone: '1234567890'} }, format: 'json'
      customer1=Customer.last
      customer1.name.should eq 'a'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid customer updation with invalid id' do
      customer = FactoryGirl.create(:customer)
      put :update, params: { id: customer.id, customer: {} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid customer updation with invalid id' do
      customer = FactoryGirl.create(:customer)
      put :update, params: { id: customer.id, customer: { name: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid customer updation with invalid id' do
      customer = FactoryGirl.create(:customer)
      put :update, params: { id: customer.id, customer: { address: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid customer updation with invalid id' do
      customer = FactoryGirl.create(:customer)
      put :update, params: { id: customer.id, customer: { phone: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid customer deletion' do
      customer = FactoryGirl.create(:customer)
      delete :destroy, params: { id: customer.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid customer deletion with invalid id' do
      customer = FactoryGirl.create(:customer)
      delete :destroy, params: { id: '' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end

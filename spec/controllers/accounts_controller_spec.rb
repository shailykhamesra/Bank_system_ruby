require 'rails_helper'
RSpec.describe AccountsController, type: :controller do
  context 'GET index' do
    it 'should show all accounts successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show account with given id successfully' do
      account = FactoryGirl.create(:account)
      get :show, params: { id: account.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid accounts' do
      account = FactoryGirl.create(:account)
      get :show, params: { id: '' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid account creation' do
      customer = FactoryGirl.create(:customer)
      post :create, params: { account: { account_no: Faker::Number.number(8), balance: Faker::Number.positive(8), customer_id: customer.id } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not create a acccount with invalid input' do
      post :create, params: { account: { acount_no: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not create a accounts with nil entries' do
      account = FactoryGirl.create(:account)
      post :create, params: { account: { account_no: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not create a accounts with nil entries' do
      account = FactoryGirl.create(:account)
      post :create, params: { account: { balance: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid account updation' do
      account = FactoryGirl.create(:account)
      put :update, params: { id: account.id, account: { account_no: '1234', balance: '1234' } }, format: 'json'
      account1=Account.last
      account1.account_no.should eq 1234
      response.should have_http_status(:ok)
    end
    it 'should not be a valid account updation with invalid id' do
      account = FactoryGirl.create(:account)
      put :update, params: { id: account.id, account: {} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid account deletion' do
      account = FactoryGirl.create(:account)
      delete :destroy, params: { id: account.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid account deletion with invalid id' do
      account = FactoryGirl.create(:account)
      delete :destroy, params: { id: '' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end

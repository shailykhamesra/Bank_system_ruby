require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  context 'GET index' do
    it 'should show all transaction successfully' do
      transaction1 = FactoryGirl.create(:transaction)
      transaction2 = FactoryGirl.create(:transaction)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show transaction with given id successfully' do
      transaction = FactoryGirl.create(:transaction)
      get :show, params: { id: transaction.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'POST create' do 
    it 'should be a valid transaction creation' do 
      transaction= FactoryGirl.create(:transaction)
      post :create, params: {transaction: { account_type: transaction.account_type, account_id: transaction.account_id}}, format: 'json' 
      response.should have_http_status(:ok)
    end
  end 
  context 'PUT update' do
    it 'should be valid transaction updation' do
      transaction = FactoryGirl.create(:transaction)
      put :update, params: {id: transaction.id, transaction: {account_type: transaction.account_type, account_id: transaction.account_id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid transaction deletion' do
      transaction= FactoryGirl.create(:transaction)
      delete :destroy, params: { id: transaction.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
	  it 'should not show a valid transaction' do
	    transaction = FactoryGirl.create(:transaction)
	    get :show, params:{id:""}, format: 'json'
	    response.should_not have_http_status(:ok)
    end
  end
  context 'POST create' do
	  it 'should not create a transaction with invalid input' do
	    transaction = FactoryGirl.create(:transaction)
	    post :create, params: {transaction: {account_type: transaction.account_type}},format: 'json'
	    response.should_not have_http_status(:ok)
	  end
	  it 'should not create a transaction with nil entries' do
	    transaction = FactoryGirl.create(:transaction)
	    post :create, params:{transaction: {account_type: nil}},format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
  context 'PUT update' do
	  it 'should not be a valid transaction updation with invalid id' do
	    transaction = FactoryGirl.create(:transaction)
	    put :update, params: {id:transaction.id, transaction: {}}, format: 'json'
	    response.should have_http_status(:unprocessable_entity)
	  end
  end 
  context 'DELETE destroy' do
	  it 'should not be a valid transaction deletion with invalid id' do
	    transaction = FactoryGirl.create(:transaction)
	    delete :destroy,params:{id:""}, format: 'json'
	    response.should have_http_status(:unprocessable_entity)
	  end
  end
end

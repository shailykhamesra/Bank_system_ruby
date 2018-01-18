require 'rails_helper'
RSpec.describe AccountsController, type: :controller do
  context 'GET index' do
    it 'should show all accounts successfully' do
      account1 = FactoryGirl.create(:customer)
      account2 = FactoryGirl.create(:customer)
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
  end
  context 'POST create' do 
    it 'should be a valid account creation' do 
      account = FactoryGirl.create(:account)
      post :create, params: {account: { account_no:account.account_no,balance:account.balance, customer_id: account.customer_id}}, format: 'json' 
      response.should have_http_status(:ok)
    end
  end 
  context 'PUT update' do
    it 'should be valid account updation' do
      account= FactoryGirl.create(:account)
      put :update, params: {id: account.id, account: {acount_no:account.account_no,balance:account.balance}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid account deletion' do
      account = FactoryGirl.create(:account)
      delete :destroy, params: { id: account.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
	  it 'should not show a valid accounts' do
	    account = FactoryGirl.create(:account)
	    get :show, params:{id:""}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
  context 'POST create' do
	  it 'should not create a acccount with invalid input' do
	    account = FactoryGirl.create(:account)
	    post :create, params: {account: {acount_no:account.account_no}},format: 'json'
	    response.should_not have_http_status(:ok)
	  end
	  it 'should not create a accounts with nil entries' do
	    account= FactoryGirl.create(:account)
	    post :create, params:{account: {account_no: nil}},format: 'json'
	    response.should_not have_http_status(:ok)
	  end
    it 'should not create a accounts with nil entries' do
      account= FactoryGirl.create(:account)
      post :create, params:{account: {balance: nil}},format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
  context 'PUT update' do
	  it 'should not be a valid account updation with invalid id' do
	    account = FactoryGirl.create(:account)
	    put :update, params: {id:account.id ,account: {}}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end 
  context 'DELETE destroy' do
	  it 'should not be a valid account deletion with invalid id' do
	    account = FactoryGirl.create(:account)
	    delete :destroy, params:{id:""}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
end

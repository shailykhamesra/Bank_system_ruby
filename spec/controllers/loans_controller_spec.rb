require 'rails_helper'
RSpec.describe LoansController, type: :controller do
  context 'GET index' do
    it 'should show all loans successfully' do
      loan1 = FactoryGirl.create(:loan)
      loan2 = FactoryGirl.create(:loan)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show loan with given id successfully' do
      loan = FactoryGirl.create(:loan)
      get :show, params: { id: loan.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'POST create' do 
    it 'should be a valid loan creation' do 
      loan = FactoryGirl.create(:loan)
      post :create, params: {loan: { loan_type: loan.loan_type, account_id: loan.account_id}}, format: 'json' 
      response.should have_http_status(:ok)
    end
  end 
  context 'PUT update' do
    it 'should be valid loan updation' do
      loan = FactoryGirl.create(:loan)
      put :update, params: {id: loan.id, loan: {loan_type: loan.loan_type, account_id: loan.account_id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid loan deletion' do
      loan = FactoryGirl.create(:loan)
      delete :destroy, params: { id: loan.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
	  it 'should not show a valid loan' do
	    loan = FactoryGirl.create(:loan)
	    get :show, params:{id:""}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
  context 'POST create' do
	  it 'should not create a loan with invalid input' do
	    loan = FactoryGirl.create(:loan)
	    post :create, params: {loan: {loan_type: loan.loan_type}},format: 'json'
	    response.should_not have_http_status(:ok)
	  end
	  it 'should not create a loan with nil entries' do
	    loan = FactoryGirl.create(:loan)
	    post :create, params:{loan: {loan_type: nil}},format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
  context 'PUT update' do
	  it 'should not be a valid loan updation with invalid id' do
	    loan = FactoryGirl.create(:loan)
	    put :update, params: {id:loan.id,loan: {}}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end 
  context 'DELETE destroy' do
	  it 'should not be a valid loan deletion with invalid id' do
	    loan = FactoryGirl.create(:loan)
	    delete :destroy, params:{id:""}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
end

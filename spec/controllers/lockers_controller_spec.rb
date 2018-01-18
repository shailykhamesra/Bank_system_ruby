require 'rails_helper'

RSpec.describe LockersController, type: :controller do
  context 'GET index' do
    it 'should show all lockers successfully' do
      locker1 = FactoryGirl.create(:locker)
      locker2 = FactoryGirl.create(:locker)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show locker with given id successfully' do
      locker = FactoryGirl.create(:locker)
      get :show, params: { id: locker.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'POST create' do 
    it 'should be a valid locker creation' do 
      locker = FactoryGirl.create(:locker)
      post :create, params: {locker: { locker_key: locker.locker_key, account_id: locker.account_id}}, format: 'json' 
      response.should have_http_status(:ok)
    end
  end 
  context 'PUT update' do
    it 'should be valid locker updation' do
      locker= FactoryGirl.create(:locker)
      put :update, params: {id: locker.id, locker: {locker_key: locker.locker_key, account_id: locker.account_id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid locker deletion' do
      locker = FactoryGirl.create(:locker)
      delete :destroy, params: { id: locker.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
	  it 'should not show a valid locker' do
	    locker = FactoryGirl.create(:locker)
	    get :show, params:{id:""}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
  context 'POST create' do
	  it 'should not create a locker with invalid input' do
	    locker = FactoryGirl.create(:locker)
	    post :create, params: {locker: {locker_key: locker.locker_key}},format: 'json'
	    response.should_not have_http_status(:ok)
	  end
	  it 'should not create a locker with nil entries' do
	    locker = FactoryGirl.create(:locker)
	    post :create, params:{locker: {locker_key: nil}},format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
  context 'PUT update' do
	  it 'should not be a valid locker updation with invalid id' do
	    locker = FactoryGirl.create(:locker)
	    put :update, params: {id:locker.id, locker: {}}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end 
  context 'DELETE destroy' do
	  it 'should not be a valid locker deletion with invalid id' do
	    locker = FactoryGirl.create(:locker)
	    delete :destroy, params:{id:""}, format: 'json'
	    response.should_not have_http_status(:ok)
	  end
  end
end

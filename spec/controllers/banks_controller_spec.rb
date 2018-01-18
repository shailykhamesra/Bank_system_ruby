require 'rails_helper'
RSpec.describe BanksController, type: :controller do
  context 'GET index' do
    it 'should show all customers successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show customers with given id successfully' do
      bank = FactoryGirl.create(:bank)
      get :show, params: { id: bank.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'POST create' do 
    it 'should be a valid customer creation' do 
      bank = FactoryGirl.create(:bank)
      post :create, params: {bank: { name: bank.name, address: bank.address, phone:bank.phone}}, format: 'json' 
      response.should have_http_status(:ok)
    end
  end 
  context 'PUT update' do
    it 'should be valid customer updation' do
      bank = FactoryGirl.create(:bank)
      put :update, params: {id: bank.id, bank: {name: bank.name, address: bank.address, phone:bank.phone}} , format:'json'
      response.should have_http_status(:ok)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid customer deletion' do
      bank= FactoryGirl.create(:bank)
      delete :destroy, params: { id: bank.id }, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should not show a valid customers' do
      bank = FactoryGirl.create(:bank)
      get :show, params:{id:""}, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
  context 'POST create' do
    it 'should not create a customer with invalid input' do
      bank = FactoryGirl.create(:bank)
      post :create, params: {bank: {name: bank.name}},format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not create a customers with nil entries' do
      bank= FactoryGirl.create(:bank)
      post :create, params:{bank: {name: nil}},format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not create a customers with nil entries' do
      bank= FactoryGirl.create(:bank)
      post :create, params:{bank: {address: nil}},format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not create a customers with nil entries' do
      bank= FactoryGirl.create(:bank)
      post :create, params:{bank: {phone: nil}},format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
  context 'PUT update' do
    it 'should not be a valid customer updation with invalid id' do
      bank = FactoryGirl.create(:bank)
      put :update, params: {id:bank.id,bank: {}}, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid customer updation with invalid id' do
      bank = FactoryGirl.create(:bank)
      put :update, params: {id:bank.id,bank: {name: nil}}, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid customer updation with invalid id' do
      bank = FactoryGirl.create(:bank)
      put :update, params: {id:bank.id,bank: {address: nil}}, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid customer updation with invalid id' do
      bank = FactoryGirl.create(:bank)
      put :update, params: {id:bank.id,bank: {phone: nil}}, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end 
  context 'DELETE destroy' do
    it 'should not be a valid customer deletion with invalid id' do
      bank = FactoryGirl.create(:bank)
      delete :destroy, params:{id:""}, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end

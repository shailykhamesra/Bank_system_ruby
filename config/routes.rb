Rails.application.routes.draw do
  get 'bank/index'
  resources :banks
  resources :accounts
  resources :customers
  resources :loans
  resources :lockers
  resources :transactions
  root 'bank#index'
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  } 
  resources :users
  root 'welcome#index'
  scope module: 'admin' do
    resources :banks
  end
  resources :accounts
  resources :transactions
  patch 'accounts/bank_accounts/:id' => 'accounts#bank_accounts', :as => 'bank_accounts' 
end

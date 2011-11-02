Mongey::Application.routes.draw do
  resources :users
  resources :currencies

  resources :categories

  resources :events
  resources :payments
  resources :transactions

  resources :accounts
  resources :payees do
    collection do
      get 'autocomplete'
    end
  end
  resources :bankaccounts

  root :to => 'home#index'
end

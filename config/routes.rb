Mongey::Application.routes.draw do
  get "login" =>  "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"
  get "settings" => "users#settings", :as => "settings"
  resources :sessions
  resources :users do
    collection do
      get "settings"
    end
  end

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

Mongey::Application.routes.draw do
  get "login" =>  "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"

  get "user" => "users#index", :as => "user"
  get "user/settings" => "users#settings", :as => "user_settings"
  put "user/settings" => "users#save_settings", :as => "user_settings"

  resources :users, :only => [:create]

  resources :sessions

  resources :currencies
  resources :categories

  resources :events
  resources :payments
  resources :deposits

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

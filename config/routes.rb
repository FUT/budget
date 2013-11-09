Budget::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "users#sign_in"
  devise_for :users
  resources :users
  resources :transfers
end

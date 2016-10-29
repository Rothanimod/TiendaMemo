Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'profile' => 'pages#profile'
  get 'dashboard' => 'purchases#dashboard'
    resources :purchases
    resources :categories
    resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

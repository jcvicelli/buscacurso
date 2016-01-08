Rails.application.routes.draw do
  resources :companies
  resources :enderecos
  devise_for :users
  root to: 'pages#index'
  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'
end

Rails.application.routes.draw do
  resources :courses
  resources :companies

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root to: 'pages#index'
  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'
end

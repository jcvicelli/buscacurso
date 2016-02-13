Rails.application.routes.draw do

  resources :category_types
  resources :courses do
    collection { get :search }
  end
  resources :companies

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root to: 'pages#index'
  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'be_company' => 'pages#be_company'
end

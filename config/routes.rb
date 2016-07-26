Rails.application.routes.draw do

  resources :areas
  resources :category_types
  resources :courses do
    collection do
     get :search
     get :autocomplete
    end
  end
  resources :companies do
    resources :employees
  end

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks" }

  root to: 'pages#index'
  get 'about'   => 'pages#about'
  get 'terms'   => 'pages#terms'
  get 'policy'   => 'pages#policy'
  get 'be_company' => 'pages#be_company'
  get 'faq'   => 'pages#faq'
  get 'support'   => 'pages#support'
  get 'steps'   => 'pages#steps'
end

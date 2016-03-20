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
  get 'contact' => 'pages#contact'
  get 'be_company' => 'pages#be_company'
end

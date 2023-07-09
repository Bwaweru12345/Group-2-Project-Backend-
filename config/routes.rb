Rails.application.routes.draw do
  resources :users do
    resources :incomes, only: [:create]
    resources :bills, only: [:create]
    resources :savings, only: [:create]
  end

  resources :incomes
  resources :bills
  resources :personals, only: [:index, :create, :destroy]
  resources :savings, only: [:index, :create] do
    post 'withdraw', on: :collection
  end

  post '/login', to: 'users#login'

end
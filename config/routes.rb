Rails.application.routes.draw do
  resources :users
  resources :incomes
  resources :bills, only: [:index, :create, :update, :destroy]
  resources :personals, only: [:index, :create, :destroy]
  resources :savings, only: [:index, :create] do
    post 'withdraw', on: :collection
  end
end

Rails.application.routes.draw do

  resources :user_stocks
  devise_for :users
  root 'users#my_portfolio'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'

  resources :stocks, only: [:create]
end

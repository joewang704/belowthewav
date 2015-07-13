Rails.application.routes.draw do
  root           'pages#index'
  get 'about' => 'pages#about'

  devise_for :admins
  devise_for :users

  resources :articles
end

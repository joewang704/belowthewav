Rails.application.routes.draw do
  devise_for :users
  # make all articles home page for now
  # TODO: make actual homepage
  root 'articles#index'
  resources :articles
end

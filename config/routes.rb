Rails.application.routes.draw do
  # make all articles home page for now
  # TODO: make actual homepage
  root 'articles#index'
  resources :articles
end

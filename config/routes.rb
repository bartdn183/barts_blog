Rails.application.routes.draw do
  resources :comments, only: [:create, :destroy]
  # resources :categories
  devise_for :users
  resources :blog_posts
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

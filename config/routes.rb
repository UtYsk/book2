Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#top'
  get 'users/:id' => 'users#show'
  get 'users/about' => 'users#about'
  get 'users' => 'users#index'
  get 'books' => 'books#index'
  post 'books/new' => 'books#create'
  resources :books, only: [:new, :create, :index, :show]
  resources :books, only: [:new, :create, :index, :show, :destroy] do
  end
  resources :users, only: [:show, :edit]
  resources :users, only: [:show, :edit, :update]
  
end
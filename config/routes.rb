Rails.application.routes.draw do

  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :books, only: [:new, :index, :show, :create, :destroy, :update, :edit]
  resources :users, only: [:show, :edit, :update, :index, :update, :destroy]


end

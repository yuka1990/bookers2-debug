Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  resources :book_comments, only:[:create,:destroy]
  resource :favorites, only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:edit,:update,] do
  resource :relationships, only: [:create, :destroy]
   get "following" => "relationships#following", as: "following"
   get "followers" => "relationships#followers" , as: "followers"
  end

  get "search" => "searches#search"
  get 'tagsearches/search' => 'tag_searches#search'

  resources :chats, only: [:show, :create, :destroy]
  resources :groups, only: [:new, :index, :show, :create, :edit, :update]do
    resource :group_users, only:[:create, :destroy]
  end
  devise_scope :user do
    post "users/guest_sign_in" , to: "users/sessions#guest_sign_in"
  end
  resources :notifications, only: [:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
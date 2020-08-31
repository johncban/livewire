Rails.application.routes.draw do
  #resources :follows
  #get 'posts/create'
  #get 'posts/update'
  #get 'posts/destroy'

  #get 'main/index'
  
  devise_for :users
  
  #mount Commontator::Engine => '/commontator'

  authenticated :user do
    root "user_dashboard#index", as: :authenticated_root
  end

  resources :appointments
  resources :posts
  resources :comments
  #resources :relationships, only: [:create, :destroy]
  resources :friends, only: [:index, :create]
  resources :users #, only: [:show]

  post :'/users/:id/follow', to: "users#follow", as: "follow_user"
  post :'/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  post "/friends/add" => "friends/add"
  post "/friends/reject" => "friends/reject"
  post "/friends/remove" => "friends/remove"
  get "/friends/search" => "friends/search"
  post "/friends/search" => "friends/search"

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#main'

  if Rails.env.development? and defined?(Localtower)
    mount Localtower::Engine, at: "localtower"
  end
end

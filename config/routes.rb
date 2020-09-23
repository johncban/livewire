Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  # mount Commontator::Engine => '/commontator'

  authenticated :user do
    root 'user_dashboard#index', as: :authenticated_root
  end

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end


  resources :users, only: [:show, :edit, :update] do 
    post :'/users/:id/follow', to: 'users#follow', as: 'follow_user'
    post :'/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'
    resources :posts
    resources :appointments
  end


  
  resources :posts, only: [:index]
  resources :comments
  
  resources :friends, only: %i[index create]
  

  post '/friends/add' => 'friends/add'
  post '/friends/reject' => 'friends/reject'
  post '/friends/remove' => 'friends/remove'
  get '/friends/search' => 'friends/search'
  post '/friends/search' => 'friends/search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#main'


  mount Localtower::Engine, at: 'localtower' if Rails.env.development? && defined?(Localtower)
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    root 'user_dashboard#index', as: :authenticated_root
  end

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  resources :users, only: %i[show edit update] do
    post :'/users/:id/follow', to: 'users#follow', as: 'follow_user'
    post :'/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'
    post :'/button', to: 'posts#test_a_button', as: 'button'
    get '/appointments/search' => 'appointments/search'
    post '/appointments/search' => 'appointments/search'
    resources :posts
    resources :appointments
  end

  resources :appointments, only: [:show]
  resources :comments
  resources :friends, only: %i[index create]

  post '/friends/add' => 'friends/add'
  post '/friends/reject' => 'friends/reject'
  post '/friends/remove' => 'friends/remove'
  get '/friends/search' => 'friends/search'
  post '/friends/search' => 'friends/search'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#main'

  match '*path', to: 'application#routing_error', via: %i[get post]

  mount Localtower::Engine, at: 'localtower' if Rails.env.development? && defined?(Localtower)
end

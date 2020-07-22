Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root "pages#home", as: :authenticated_root
  end

  root 'pages#main'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development? and defined?(Localtower)
    mount Localtower::Engine, at: "localtower"
  end
end

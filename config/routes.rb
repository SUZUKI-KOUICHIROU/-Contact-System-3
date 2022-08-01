Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: "omniauth_callbacks"
  }
  
  devise_scope :user do
    root "devise/sessions#new"
    get '/users/signin', to: 'devise/sessions#new'
    post '/users/signin', to: 'devise/sessions#create'
    delete 'users/signout', to: 'devise/sessions#destroy'
    get '/users/signup', to: 'devise/registrations#new'
  end

  get 'show', to: 'users#show'
  #get 'sessions/new'
  #root 'static_pages#top'
  #get '/signup', to: 'users#new'
  
  #ログイン機能
  #get    '/login', to: 'sessions#new'
  #post   '/login', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy'

  get 'new_guardian', to: 'users#new_guardian'
  post 'create_guardian', to: 'users#create_guardian'
  
  
  resources :schoolclasses do
  end
  resources :students do
  end
  resources :classnumbers do
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

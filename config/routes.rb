Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 
  resources :users do
    member do
      get 'new_teacher'
      post 'teacher_create'
      get 'teacher_index'
      get 'schoolclasses/class_index' 
      get 'schoolclasses/edit_1'       
    end
  end
  resources :schoolclasses do
  end
  resources :class_numbers do 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

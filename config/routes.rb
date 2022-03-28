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
      get 'edit_teacher'
      get 'teacher_index'
      get 'student_index'
      get 'schoolclasses/class_index' 
      get 'schoolclasses/edit_1'       
      
      get 'schoolclasses/teacher_contact_index'
      get 'schoolclasses/edit_teacher_contact'
      patch 'schoolclasses/update_teacher_contact'
      
      get 'schoolclasses/show_teacher_contact'
      get 'schoolclasses/teacher_contact'
      patch 'schoolclasses/update_school_contact'
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

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
      post 'create_teacher'
      get 'edit_teacher'
      get 'teacher_index'
      
      get 'new_student'
      post 'create_student'
      patch 'student_update'
      get 'student_index'
      get 'student_index_2'
      get 'student_index_3'
      get 'student_detail'

      get 'schoolclasses/class_index' 
      get 'schoolclasses/edit_1'
      get 'schoolclasses/edit_2'
      get 'schoolclasses/edit_3'
      get 'schoolclasses/edit_4'
      get 'schoolclasses/edit_5'
      get 'schoolclasses/edit_6'       
      
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
  resources :classnumbers do 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

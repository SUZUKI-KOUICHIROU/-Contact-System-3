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
      get 'edit_admin'
      patch 'update_admin'
      
      get 'new_teacher'
      post 'create_teacher'
      get 'edit_teacher'
      patch 'update_teacher'
      get 'teacher_index'
      
      get 'new_student'
      post 'create_student'
      get 'edit_student'
      patch 'update_student'
      get 'student_index'
      get 'student_index_2'
      get 'student_index_3'
      get 'student_detail'

      get 'edit_student_2'
      
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
      
      get 'schoolclasses/edit_teacher_contact_2'
      patch 'schoolclasses/update_teacher_contact_2'
  
      get 'schoolclasses/edit_teacher_contact_3'
      patch 'schoolclasses/update_teacher_contact_3'
      
      get 'schoolclasses/show_teacher_contact'
      get 'schoolclasses/teacher_contact'
      patch 'schoolclasses/update_school_contact'
    
      get 'schoolclasses/index_teacher_contact'
      get 'schoolclasses/edit_teacherwhat_contact'
      patch 'schoolclasses/update_teacherwhat_contact'
      
      get 'schoolclasses/index_guardian_contact'
      get 'schoolclasses/edit_teacherform_contact'
      patch 'schoolclasses/update_teacherform_contact'

      get 'schoolclasses/edit_guardianwhat_contact'
      patch 'schoolclasses/update_guardianwhat_contact'

      get 'schoolclasses/edit_guardianform_contact'
      patch 'schoolclasses/update_guardianform_contact'
      
      get 'schoolclasses/board_create_index'
      get 'schoolclasses/edit_class_board'
      patch 'schoolclasses/update_class_board'
      get 'schoolclasses/guardian_board_index'
      get 'schoolclasses/show_board'

      get 'show_student'
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

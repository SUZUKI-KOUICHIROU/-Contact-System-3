Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  devise_scope :user do
    root "devise/sessions#new"
    get '/users/signin', to: 'devise/sessions#new'
    post '/users/signin', to: 'devise/sessions#create'
    delete 'users/signout', to: 'devise/sessions#destroy'
    get '/users/signup', to: 'devise/registrations#new'
    get 'users', to: 'devise/registrations#edit'
    patch 'users', to: 'devise/registrations#update'
  end
  
  get 'show', to: 'users#show'
  
  #get 'sessions/new'
  #root 'static_pages#top'
  #get '/signup', to: 'users#new'
  
  #ログイン機能
  #get    '/login', to: 'sessions#new'
  #post   '/login', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy'

  #get 'new_guardian', to: 'users#new_guardian'
  #post 'create_guardian', to: 'users#create_guardian'
  
  resources :users do
    member do     
      get 'edit_admin'
      patch 'update_admin'
  
      delete 'student_destroy'
      delete 'student_destroy2'

      delete 'guardian_destroy'
      
      get 'new_teacher'
      post 'create_teacher'
      get 'edit_teacher'
      patch 'update_teacher'
      get 'teacher_index'
      
      get 'guardian_detail'
      get 'edit_guardian'
      patch 'update_guardian'
      
      get 'students/new'
      post 'students/create'
      get 'students/edit_student'
      patch 'students/update_student'
      get 'students/student_detail'
      
      get 'student_index'
      get 'student_index_2'
      get 'student_index_3'
  
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

      get 'schoolclasses/guardian_board_index2'

      get 'show_student'
      get 'schoolclasses/show_board2'
      
      get 'schoolclasses/edit_teacher_line'
      patch 'schoolclasses/update_teacher_line'
      get 'schoolclasses/line_aarticipation'
    end
  end
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

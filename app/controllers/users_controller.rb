class UsersController < ApplicationController

  before_action :set_user, only: %i(show edit update edit_teacher destroy show_teacher_contact student_detail student_index student_index_2 student_index_3
                                    edit_student_1 update_student_1 new_student create_student edit_student update_student show_student edit_student_2)
  before_action :logged_in_user, only: %i(index teacher_index show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_teacher_user, only: %i(edit_teacher)
  before_action :admin_user, only: %i(teacher_index new_teacher destroy)
  #before_action :teacher_user, only: %i()
  before_action :class_choice, only: %i(new_teacher create_teacher edit_teacher new_student edit_student edit_student_2)
  #before_action :class_select, only: %i(new_student)

  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @students = User.where(guardian_name: @user.guardian_name)
  end
  
  def show_student
    @students = User.where(class_number: @user.class_number).where(teacher: false)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(student_params)
    if @user.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      #render :new
    end
  end
  
  #担任登録
  
  def new_teacher
    @user = User.new
  end

  def create_teacher
    @user = User.new(teacher_params)
    if @user.save
      flash[:success] = '担任を登録しました。'
      redirect_to @user
    else
      flash[:danger] = "失敗しました。" 
      render :new_teacher
    end
  end
  
  def edit_teacher
  end
  
  #担任一覧
  
  def teacher_index
    @teachers = User.where(teacher: true)
  end
  
  # 生徒登録
  
  def new_student
    @user = User.new
    @guardian = current_user.guardian_name
  end

  def create_student
    @user = User.new(student_params)
    if @user.save
      flash[:success] = '生徒登録が完了しました。'
      redirect_to student_index_user_url(current_user)
    else
      flash[:danger] = "生徒登録が失敗しました。"
      render :new_student
    end
  end
  
  def edit_student
  end
  
  def update_student
    if @user.update(student_params)
      flash[:success] = "生徒情報を更新しました。"
      redirect_to current_user
    else
      render :edit      
    end
  end
  
  # 生徒一覧（担任）
  
  def student_index
    @students = User.where(admin: false, teacher: false)
    @student_count = User.where(teacher: false, class_number: @user.class_number).count 
  end
  
  # 生徒情報編集（担任）
  def edit_student_2
  end
  
  # 生徒一覧（管理者）
  
  def student_index_2
    @students = User.where(admin: false, teacher: false).order(:class_number) 
    @student_count = User.where(teacher: false, class_number: @user.class_number).count 
  end
  
  #生徒一覧（一括表示）
  
  def student_index_3
    @students = User.where(admin: false, teacher: false).order(:class_number) 
    #@students = User.paginate(page: params[:page]) 
  end

  # 生徒詳細

  def student_detail
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to student_index_3_user_url(current_user)
  end

  private

    def student_params
      params.require(:user).permit(:name, :guardian_name, :email, :student_number, :birthday, 
                                  :address, :telephone_number, :password, :password_confirmation).merge(class_number: @user.class_number)
    end
  
    def teacher_params
      params.require(:user).permit(:name, :email, :class_number, :password, :password_confirmation).merge(teacher: "true")
    end
end

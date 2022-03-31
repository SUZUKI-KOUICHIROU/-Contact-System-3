class UsersController < ApplicationController
  
  before_action :set_user, only: %i(show edit update edit_teacher destroy show_teacher_contact student_detail)
  before_action :logged_in_user, only: %i(index teacher_index show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: %i(teacher_index new_teacher edit_teacher destroy)
  before_action :class_choice, only: %i(new)

  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @first_day = Date.current.beginning_of_month
    @last_day = @first_day.end_of_month
  end
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end
  
  #担任登録
  
  def new_teacher
    @user = User.new
  end

  def teacher_create
    @user = User.new(teacher_params)
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
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
  end

  def create_student
  end
  
  # 生徒一覧
  
  def student_index
    @students = User.where(admin: false, teacher: false)
  end
  
  # 生徒詳細

  def student_detail
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :class_number, :password, :password_confirmation)
    end
  
    def teacher_params
      params.require(:user).permit(:name, :email, :class_number, :password, :password_confirmation)
    end
end

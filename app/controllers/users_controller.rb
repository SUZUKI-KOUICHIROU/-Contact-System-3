class UsersController < ApplicationController
  
  before_action :set_user, only: %i(show edit update edit_teacher destroy show_teacher_contact)
  before_action :logged_in_user, only: %i(index teacher_index show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: %i(teacher_index new_teacher edit_teacher destroy)
  
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def teacher_index
    @teachers = User.where(teacher: true)
  end
  
  def student_index
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

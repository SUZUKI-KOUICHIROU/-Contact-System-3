class UsersController < ApplicationController
  
  before_action :set_user, only: %i(show edit update edit_teacher destroy show_teacher_contact student_detail student_index student_index_2)
  before_action :logged_in_user, only: %i(index teacher_index show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_teacher_user, only: %i(edit_teacher)
  before_action :admin_user, only: %i(teacher_index new_teacher destroy)
  #before_action :teacher_user, only: %i()
  before_action :class_choice, only: %i(new edit)

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
    @user = User.new(student_params)
    if @user.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  #担任登録
  
  def new_teacher
    @user = User.new
  end

  def teacher_create
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
  end

  def create_student
    @user = User.new(student_params)
    if @user.save
      #log_in @user # 保存成功後、ログインします。 
      flash[:success] = '新規作成に成功しました。'
      redirect_to current_user
    else
      render :new_student
    end
  end
  
  def student_update
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
  
  # 生徒一覧（管理者）
  
  def student_index_2
    @students = User.where(admin: false, teacher: false).order(:class_number) 
    @student_count = User.where(teacher: false, class_number: @user.class_number).count 
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

    def student_params
      params.require(:user).permit(:name, :guardian_name, :email, :class_number, :student_number, :password, :password_confirmation)
    end
  
    def teacher_params
      params.require(:user).permit(:name, :email, :class_number, :password, :password_confirmation)
    end
end

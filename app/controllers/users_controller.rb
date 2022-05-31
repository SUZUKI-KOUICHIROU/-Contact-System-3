class UsersController < ApplicationController

  before_action :set_user, only: %i(show edit update edit_teacher destroy show_teacher_contact student_detail student_index student_index_2 student_index_3
                                    edit_student_1 update_student_1 new_student create_student edit_student update_student show_student edit_student_2 
                                    edit_admin update_admin edit_teacher update_teacher edit_guardian update_guardian guardian_detail)
  before_action :logged_in_user, only: %i(index teacher_index show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_teacher_user, only: %i(edit_teacher)
  before_action :admin_user, only: %i(teacher_index new_teacher destroy)
  before_action :class_choice, only: %i(new_teacher create_teacher edit_teacher new_student edit_student edit_student_2)
  before_action :set_one_month, only: %i(show)

  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @students = @user.students.where(params[:id]).order(:class_belongs)
    @guardian = @user.students.where(user_id: @user.id)
    @boards = Schoolclass.where.not(board_class: nil)
  end
  
  def show_student
    @students = User.where(class_number: @user.class_number).where(teacher: false)
  end

  def guardian_detail
  end
  
  #保護者
  def new
    @user = User.new
  end

  def create
    @user = User.new(guardian_params)
    if @user.save
      log_in @user
      flash[:success] = 'アカウント作成に成功しました。'
      redirect_to @user
    else
      flash[:danger] = '失敗しました。'
      render :new
    end
  end

  def edit_guardian
  end

  def update_guardian
    if @user.update(guardian_params)
      flash[:success] = "保護者情報を更新しました。"
      redirect_to current_user
    else
      render :edit_guardian     
    end  
  end
  
  def student_detail
  end
  
  #管理者情報編集
  def edit_admin
  end
  
  def update_admin
    if @user.update(admin_params)
      flash[:success] = "管理者情報を更新しました。"
      redirect_to current_user
    else
      render :edit_admin      
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
  
  #担任編集
  
  def edit_teacher
  end

  def update_teacher
    if @user.update(teacher_params)
      flash[:success] = "担任情報を更新しました。"
      redirect_to current_user
    else
      render :edit_teacher      
    end
  end

  #担任一覧
  
  def teacher_index
    @teachers = User.where(teacher: true)
  end
  
  # 生徒一覧（担任）
  
  def student_index
    @students = Student.where(class_belongs: @user.class_number)
    @guardians = User.where(admin: false, teacher: false) 
    @student_count = Student.where(class_belongs: @user.class_number).count 
  end
  
  # 生徒情報編集（担任）
  def edit_student_2
  end
  
  # 生徒一覧（管理者）
  
  def student_index_2
    @students = Student.where(class_belongs: @user.class_number).order(:class_number) 
    @guardians = User.where(admin: false, teacher: false)
    @student_count = Student.where(class_belongs: @user.class_number).count 
  end
  
  #生徒一覧（一括表示）
  
  def student_index_3
    @students = Student.all.order(:class_belongs)
    @guardians = User.where(admin: false, teacher: false) 
    #@students = User.paginate(page: params[:page]) 
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to student_index_3_user_url(current_user)
  end

  private
    def guardian_params
      params.require(:user).permit(:name, :email, :address, :telephone_number, :password, :password_confirmation)
    end

    def guardian_params
      params.require(:user).permit(:name, :email, :address, :telephone_number, :password, :password_confirmation)
    end
  
    def teacher_params
      params.require(:user).permit(:name, :email, :class_number, :password, :password_confirmation).merge(teacher: "true")
    end

    def admin_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

class StudentsController < ApplicationController

  before_action :set_user, only: %i(new create student_detail edit_student update_student)
  before_action :set_student, only: %i(student_detail edit_student update_student destroy)
  before_action :class_choice, only: %i(new create edit_student)
  before_action :correct_user, only: %i(new)
  before_action :correct_administrator_user, only: %i(student_detail)
  before_action :correct_teacherguardian_user, only: %i(edit_student)

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to current_user, notice: "生徒登録が完了しました。"
    else
      flash[:alert] = '失敗しました。'
      render :new
    end
  end

  def edit_student
  end

  def update_student
    if @student.update(student_update_params)
      redirect_to student_index_user_url(current_user), notice: "生徒情報を更新しました。"
    else
      render :edit_student     
    end
  end
  
  def student_detail
    @guardians = User.where(id: @student.user_id)
  end

  def destroy
    @student.destroy
    redirect_to student_index_3_user_url(current_user), notice: "#{@student.student_name}のデータを削除しました。"
  end

  private

    def student_params
      params.require(:student).permit(:student_name, :class_belongs, :student_number, :birthday, :classnumber_id).merge(user_id: @user.id, guardian_name: current_user.name)
    end

    def student_update_params
      params.require(:student).permit(:student_name, :class_belongs, :student_number, :birthday)
    end
end

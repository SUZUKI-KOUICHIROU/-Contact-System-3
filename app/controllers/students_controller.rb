class StudentsController < ApplicationController

  before_action :set_user, only: %i(new create student_detail)
  before_action :set_student, only: %i(student_detail edit_student update_student destroy)
  before_action :class_choice, only: %i(new create edit_student)

  def new
    @student = Student.new
  end

  def create
    @student = current_user.students.build(student_params)
    if @student.save
      flash[:success] = '生徒登録が完了しました。'
      redirect_to current_user
    else
      flash[:danger] = '失敗しました。'
      render :new
    end
  end

  def edit_student
  end

  def update_student
    if @student.update(student_update_params)
      flash[:success] = "生徒情報を更新しました。"
      redirect_to current_user
    else
      render :edit_student     
    end
  end
  
  def student_detail
  end

  def destroy
    @student.destroy
    flash[:success] = "#{@student.student_name}のデータを削除しました。"
    redirect_to student_index_3_user_url(current_user)
  end

  private

    def student_params
      params.require(:student).permit(:student_name, :class_belongs, :student_number, :birthday).merge(guardian_name: current_user.name)
    end

    def student_update_params
      params.require(:student).permit(:student_name, :class_belongs, :student_number, :birthday)
    end
end

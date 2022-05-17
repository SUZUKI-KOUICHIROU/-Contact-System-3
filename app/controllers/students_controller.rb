class StudentsController < ApplicationController

  before_action :set_user, only: %i(new create)
  before_action :class_choice, only: %i(new create)

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

    private

    def student_params
      params.require(:student).permit(:student_name, :class_belongs, :student_number, :birthday).merge(guardian_name: @user.name)
    end
end

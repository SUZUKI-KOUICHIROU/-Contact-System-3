class SchoolclassesController < ApplicationController
  before_action :set_schoolclass, only: %i(index)

  def class_index 
  end 
  
  def new
    @schoolclass = Schoolclass.new
  end

  def create
    @schoolclass = current_user.schoolclasses.create(schoolclass_params)
    if @schoolclass.save
      flash[:success] = 'クラスを作成しました。'
      redirect_to schoolclasses_class_index_user_url(current_user)
    else
      render :new
    end
  end

  def edit_1
    @schoolclassese_1 = ClassNumber.where(params[:class_name]).order(:class_name) 
    @teachers = User.where(teacher: true)   
  end

  def edit2
    @schoolclasses_2 = Schoolclass.where('class_name like ?','2-%')
  end

  def edit3 
  end

  def edit4
  end

  def edit5
  end

  def edit6
  end
  
  def destroy
    @schoolclass.destroy
    flash[:success] = "#{@schoolclass.class_name}のデータを削除しました。"
    redirect_to schoolclasses_url
  end


  private

    def schoolclass_params
      params.require(:schoolclass).permit(:class_name)
    end
  end



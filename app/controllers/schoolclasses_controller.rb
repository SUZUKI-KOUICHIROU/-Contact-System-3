class SchoolclassesController < ApplicationController
  
  #include SchoolclassesHelper
  
  before_action :set_user, only: %i(teacher_contact_index edit_teacher_contact update_teacher_contact show_teacher_contact teacher_contact destroy)
  #before_action :logged_in_user, only: []
  #before_action :correct_user, only: []
  before_action :admin_user, only: %i(class_index edit_1 teacher_contact_index edit_teacher_contact destroy)
  before_action :set_one_month, only: %i(teacher_contact_index edit_teacher_contact show_teacher_contact teacher_contact)



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

  def teacher_contact_index  
  end

  def edit_teacher_contact  
    @contact = @user.schoolclasses.where(contact_date: params[:date])
  end

  def update_teacher_contact
    teacher_contact_params.each do |id,item|  
      contact = Schoolclass.find(id)
      if contact.update(item)
        flash[:success] = '投稿しました。'
        redirect_to schoolclasses_class_index_user_url(current_user)
      else
        ender :edit_1
        flash[:danger] = "失敗しました。" 
      end
    end
  end
  
  def show_teacher_contact
    @contacts = Schoolclass.where(schoolclasses: {user_id: @user.id})
  end
  
  def teacher_contact
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
  
    def teacher_contact_params
      params.require(:user).permit(schoolclasses: [:teacher_note])[:schoolclasses]
    end 
end



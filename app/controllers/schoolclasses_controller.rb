class SchoolclassesController < ApplicationController
  
  #include SchoolclassesHelper
  
  before_action :set_user, only: %i(teacher_contact_index edit_teacher_contact update_teacher_contact show_teacher_contact teacher_contact edit_1 destroy)
  #before_action :logged_in_user, only: []
  #before_action :correct_user, only: []
  before_action :admin_user, only: %i(class_index edit_1 teacher_contact_index edit_teacher_contact destroy)
  before_action :set_one_month, only: %i(teacher_contact_index edit_teacher_contact show_teacher_contact teacher_contact)


  #学年選択
  def class_index 
  end 
  
  #クラス一覧
  def edit_1
    @schoolclassese_1 = Classnumber.where(params[:class_name]).order(:class_name) 
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
  
  #担任への連絡選択
  def teacher_contact_index  
  end
  
  #担任への連絡作成
  def edit_teacher_contact  
    @contact = @user.schoolclasses.where(contact_date: params[:date])
    @teacher_contact = @user.schoolclasses.where(contact_date: params[:date])
  end
  
  #担任への連絡投稿
  def update_teacher_contact
    teacher_contact_params.each do |id,item|  
      contact = Schoolclass.find(id)
      if contact.update(item)
        flash[:success] = '投稿しました。'
        redirect_to schoolclasses_class_index_user_url(current_user)
      else
        render :edit_1
        flash[:danger] = "失敗しました。" 
      end
    end
  end
  
  #学校からの連絡一覧
  def show_teacher_contact
    @contacts = Schoolclass.where(schoolclasses: {user_id: @user.id})
  end
  
  #学校からの連絡表示・投稿
  def teacher_contact
    @contact_title = Schoolclass.where(contact_date: params[:date])
    @contacts = @user.schoolclasses.where(contact_date: params[:date])
  end

  #学校への連絡投稿
  def update_school_contact
    school_contact_params.each do |id,item|  
      contact = Schoolclass.find(id)
      if contact.update(item)
        flash[:success] = '投稿しました。'
        redirect_to schoolclasses_show_teacher_contact_user_url(current_user)
      else
        render :show_teacher_contact
        flash[:danger] = "失敗しました。" 
      end
    end
  end
  
  def destroy
    @contact = @user.Schoolclass.find(params[:id]) 
    @contact.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to schoolclasses_teacher_contact_index_user_url
  end
  
  private

    def schoolclass_params
      params.require(:schoolclass).permit(:class_name)
    end
  
    def teacher_contact_params
      params.require(:user).permit(schoolclasses: [:title, :teacher_note])[:schoolclasses]
    end
    
    def school_contact_params
      params.require(:user).permit(schoolclasses: [:school_contact])[:schoolclasses]
    end
  end



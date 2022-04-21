class SchoolclassesController < ApplicationController
  
  #include SchoolclassesHelper
  
  before_action :set_user, only: %i(teacher_contact_index edit_teacher_contact update_teacher_contact show_teacher_contact teacher_contact destroy)
  #before_action :logged_in_user, only: []
  #before_action :correct_user, only: []
  before_action :admin_user, only: %i(class_index edit_1 edit_2 teacher_contact_index edit_teacher_contact destroy)
  before_action :set_one_month, only: %i(teacher_contact_index edit_teacher_contact show_teacher_contact teacher_contact)

  #学年選択
  def class_index 
  end 
  
  #クラス一覧
  def edit_1
    @schoolclassese_1 = Classnumber.where('class_name like ?','1-%').order(:class_name)
    @teachers = User.where(teacher: true).where('class_number like ?','1-%')
  end

  def edit_2
    @schoolclassese_2 = Classnumber.where('class_name like ?','2-%').order(:class_name)
    @teachers = User.where(teacher: true).where('class_number like ?','2-%')
  end

  def edit_3 
    @schoolclassese_3 = Classnumber.where('class_name like ?','3-%').order(:class_name)
    @teachers = User.where(teacher: true).where('class_number like ?','3-%')
  end

  def edit_4
    @schoolclassese_4 = Classnumber.where('class_name like ?','4-%').order(:class_name)
    @teachers = User.where(teacher: true).where('class_number like ?','4-%')
  end

  def edit_5
    @schoolclassese_5 = Classnumber.where('class_name like ?','5-%').order(:class_name)
    @teachers = User.where(teacher: true).where('class_number like ?','5-%')
  end

  def edit_6
    @schoolclassese_6 = Classnumber.where('class_name like ?','6-%').order(:class_name)
    @teachers = User.where(teacher: true).where('class_number like ?','6-%')
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
      else
        flash[:danger] = "失敗しました。" 
      end
      redirect_to teacher_index_user_url
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

    def teacher_contact_params
      params.require(:user).permit(schoolclasses: [:title, :teacher_note])[:schoolclasses]
    end
    
    def school_contact_params
      params.require(:user).permit(schoolclasses: [:school_contact])[:schoolclasses]
    end
  end



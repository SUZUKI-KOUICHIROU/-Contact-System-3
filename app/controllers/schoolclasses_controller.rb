class SchoolclassesController < ApplicationController
  
  #include SchoolclassesHelper
  
  before_action :set_user, only: %i(teacher_contact_index edit_teacher_contact update_teacher_contact edit_teacher_contact_2 update_teacher_contact_2 
                edit_teacher_contact_3 update_teacher_contact_3 show_teacher_contact teacher_contact  index_guardian_contact edit_teacherform_contact 
                update_teacherform_contact edit_teacherwhat_contact update_teacherwhat_contact index_teacher_contact edit_guardianwhat_contact update_guardianwhat_contact 
                edit_class_board update_class_board board_index show_board edit_guardianform_contact update_guardianform_contact board_create_index guardian_board_index update_student destroy edit_1)
  #before_action :logged_in_user, only: []
  #before_action :correct_user, only: []
  before_action :admin_user, only: %i(class_index edit_1 edit_2 teacher_contact_index edit_teacher_contact destroy)
  before_action :set_one_month, only: %i(teacher_contact_index edit_teacher_contact show_teacher_contact teacher_contact index_teacher_contact index_guardian_contact board_create_index guardian_board_index) 

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
      if contact.post_count == 0
        contact.update(item)
        contact.increment!(:post_count, 1)
        flash[:success] = '投稿しました。'
      elsif contact.post_count > contact.before_post_count
        contact.update(item.merge(before_post_count: contact.post_count, contact_update: contact.updated_at))
        contact.increment!(:post_count, 1)
        flash[:success] = '投稿しました。'
      else    
        flash[:danger] = "失敗しました。" 
      end
      redirect_to schoolclasses_teacher_contact_index_user_url
    end
  end
  
  #担任からの連絡
  def edit_teacher_contact_2  
    @contact_title = @user.schoolclasses.where(contact_date: params[:date])
    @contacts = @user.schoolclasses.where(contact_date: params[:date])
  end

  #担任への返信
  def update_teacher_contact_2
    teacher_contact_3_params.each do |id,item|
      contact = Schoolclass.find(id)
      if contact.update(item.merge(before_post_contact3: contact.post_count3, contact_update4: contact.updated_at))
        contact.increment!(:post_count3, 1)  
        flash[:success] = '投稿しました。'
      else
        flash[:danger] = "失敗しました。" 
      end
      redirect_to schoolclasses_teacher_contact_index_user_url(@user)
    end
  end

  #学校からの連絡一覧（担任）
  def show_teacher_contact
    @contacts = Schoolclass.where(schoolclasses: {user_id: @user.id})
  end
  
  #学校からの連絡・返信（担任）
  def teacher_contact
    @contact_title = @user.schoolclasses.where(contact_date: params[:date])
    @contacts = @user.schoolclasses.where(contact_date: params[:date])
  end

  #学校への返信（担任）
  def update_school_contact
    school_contact_params.each do |id,item|  
      contact = Schoolclass.find(id)
      if contact.update(item.merge(before_contact1: contact.contact_count1, contact_update2: contact.updated_at))
        contact.increment!(:contact_count1, 1)
        flash[:success] = '投稿しました。'
      else
        render :show_teacher_contact
        flash[:danger] = "失敗しました。" 
      end
      redirect_to schoolclasses_show_teacher_contact_user_url(current_user)
    end
  end

  #学校への連絡作成
  def edit_teacher_contact_3
    @contact = @user.schoolclasses.where(contact_date: params[:date])
    @teacher_contact = @user.schoolclasses.where(contact_date: params[:date])
  end
  
  #学校への連絡投稿
  def update_teacher_contact_3
    teacher_contact_2_params.each do |id,item|
      contact = Schoolclass.find(id)
      if contact.post_count2 == 0
        contact.update(item)
        contact.increment!(:post_count2, 1)
        flash[:success] = '投稿しました。'
      elsif contact.post_count2 > contact.before_post_count2
        contact.update(item.merge(before_post_count2: contact.post_count2, contact_update3: contact.updated_at))
        contact.increment!(:post_count2, 1)
        flash[:success] = '投稿しました。'
      else  
        flash[:danger] = "失敗しました。" 
      end
      redirect_to schoolclasses_show_teacher_contact_user_path(current_user) 
    end
  end

  #保護者への連絡一覧（担任）
  def index_teacher_contact
    @student = Student.find(params[:id])
    @contacts = Schoolclass.where(schoolclasses: {user_id: @user.id})
  end
  
  #保護者への連絡投稿（担任）
  def edit_teacherwhat_contact
    @student = Student.find(params[:id])
    @contact = @user.schoolclasses.where(contact_date: params[:date])
    @teacher_contact = @user.schoolclasses.where(contact_date: params[:date])
  end

  def update_teacherwhat_contact
    guardian_contact_params.each do |id,item|
      contact = Schoolclass.find(id)
      if contact.guardian_post_count1 == 0
        contact.update(item)
        contact.increment!(:guardian_post_count1, 1)
        flash[:success] = '投稿しました。'
      elsif contact.guardian_post_count1 > contact.before_guardian_postcount1
        contact.update(item.merge(before_guardian_postcount1: contact.guardian_post_count1, contact_update5: contact.updated_at))
        contact.increment!(:guardian_post_count1, 1)
        flash[:success] = '投稿しました。'
      else
        flash[:danger] = "失敗しました。" 
      end
      redirect_to schoolclasses_index_teacher_contact_user_url(@user) 
    end
  end

  #担任からの連絡一覧（保護者）
  def index_guardian_contact
    @teachers = User.where(teacher: true)
    @student = Student.find(params[:id])
    @contacts = Schoolclass.where(schoolclasses: {user_id: @user.id})
  end
  
  #担任からの連絡・返信（保護者）
  def edit_teacherform_contact
    @contact_teacher = User.where(teacher: true, class_number: @user.class_number)
    @contact_title = @user.schoolclasses.where(contact_date: params[:date])
    @contacts = @user.schoolclasses.where(contact_date: params[:date])  
  end

  def update_teacherform_contact
    guardian_contact_2_params.each do |id,item|
      contact = Schoolclass.find(id)
      if contact.update(item.merge(before_guardian_postcount2: contact.guardian_post_count2, contact_update6: contact.updated_at))
        contact.increment!(:guardian_post_count2, 1) 
        flash[:success] = '投稿しました。'
      else
        flash[:danger] = "失敗しました。" 
      end
      redirect_to schoolclasses_index_guardian_contact_user_url(@user)
    end
  end
  
  #担任への連絡（保護者）
  def edit_guardianwhat_contact
    @contact = @user.schoolclasses.where(contact_date: params[:date])
    @teacher_contact = @user.schoolclasses.where(contact_date: params[:date])
  end

  def update_guardianwhat_contact
    guardian_contact_3_params.each do |id,item|
      contact = Schoolclass.find(id)
      if contact.guardian_post_count3 == 0
        contact.update(item)
        contact.increment!(:guardian_post_count3, 1)
        flash[:success] = '投稿しました。'
      elsif contact.guardian_post_count3 > contact.before_guardian_postcount3
        contact.update(item.merge(before_guardian_postcount3: contact.guardian_post_count3, contact_update7: contact.updated_at))
        contact.increment!(:guardian_post_count3, 1) 
        flash[:success] = '投稿しました。'  
      else
        flash[:danger] = "失敗しました。" 
      end
      redirect_to schoolclasses_index_guardian_contact_user_url(@user)
    end
  end

  #保護者への返信（担任）
  def edit_guardianform_contact
    @contact_title = @user.schoolclasses.where(contact_date: params[:date])
    @contacts = @user.schoolclasses.where(contact_date: params[:date])
  end

  def update_guardianform_contact
    guardian_contact_4_params.each do |id,item|
      contact = Schoolclass.find(id)
      if contact.update(item.merge(before_guardian_postcount4: contact.guardian_post_count4, contact_update8: contact.updated_at))
        contact.increment!(:guardian_post_count4, 1)
        flash[:success] = '投稿しました。'
      else
        flash[:danger] = "失敗しました。" 
      end
      redirect_to schoolclasses_index_teacher_contact_user_url(@user) 
    end
  end
  
  #学級だより作成日付一覧
  def board_create_index
  end
  
  #学級だより作成
  def edit_class_board
    @board_date = @user.schoolclasses.where(contact_date: params[:date])
  end

  def update_class_board
    class_board_params.each do |id,item|
      contact = Schoolclass.find(id)
      if contact.update(item.merge(board_class: @user.class_number))
        flash[:success] = '投稿しました。'
      else
        flash[:danger] = "失敗しました。" 
      end
      redirect_to user_url
    end
  end
  
  #学級だより一覧（保護者）
  def guardian_board_index
    @guardian_board = Schoolclass.where(board_class: @user.class_number)
  end

  #学級だより閲覧（保護者）
  def show_board
    @news_board = Schoolclass.where(board_class: @user.class_number, contact_date: params[:date])
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
  
    def teacher_contact_2_params
      params.require(:user).permit(schoolclasses: [:title_2, :teacher_note_2])[:schoolclasses]
    end

    def teacher_contact_3_params
      params.require(:user).permit(schoolclasses: [:school_contact_2])[:schoolclasses]
    end  
    
    def guardian_contact_params
      params.require(:user).permit(schoolclasses: [:title_3, :guardian_note_1])[:schoolclasses]
    end 

    def guardian_contact_2_params
      params.require(:user).permit(schoolclasses: [:guardian_note_2])[:schoolclasses]
    end

    def guardian_contact_3_params
      params.require(:user).permit(schoolclasses: [:title_4, :guardian_note_3])[:schoolclasses]
    end
    
    def guardian_contact_4_params
      params.require(:user).permit(schoolclasses: [:guardian_note_4])[:schoolclasses]
    end

    def class_board_params
      params.require(:user).permit(schoolclasses: [:board_title, :contact_board])[:schoolclasses]
    end
  end


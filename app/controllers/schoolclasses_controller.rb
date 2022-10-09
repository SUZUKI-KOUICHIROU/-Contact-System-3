class SchoolclassesController < ApplicationController
  
  #include SchoolclassesHelper
  
  before_action :set_user, only: %i(teacher_contact_index edit_teacher_contact update_teacher_contact edit_teacher_contact_2 update_teacher_contact_2 
                edit_teacher_contact_3 update_teacher_contact_3 show_teacher_contact teacher_contact  index_guardian_contact edit_teacherform_contact 
                update_teacherform_contact edit_teacherwhat_contact update_teacherwhat_contact index_teacher_contact edit_guardianwhat_contact update_guardianwhat_contact 
                edit_class_board update_class_board board_index show_board edit_guardianform_contact update_guardianform_contact board_create_index guardian_board_index update_student destroy edit_1
                guardian_board_index2 show_board2 update_school_contact)
  #before_action :authenticate_user!, only: %i()
  before_action :teacher_user, only: %i(show_teacher_contact board_create_index edit_class_board)
  before_action :correct_guardian_user, only: %i(index_guardian_contact guardian_board_index show_board)
  #before_action :ensure_crrect_user, only: %i()
  before_action :admin_user, only: %i(class_index teacher_contact_index edit_teacher_contact edit_teacher_contact_2 class_index edit_1 edit_2 edit_3 edit_4 edit_5 edit_6  guardian_board_index2 destroy)
  before_action :correct_teacher_user, only: %i(index_teacher_contact edit_teacherwhat_contact)
  before_action :set_one_month, only: %i(teacher_contact_index edit_teacher_contact show_teacher_contact teacher_contact index_teacher_contact index_guardian_contact board_create_index guardian_board_index) 
  
  #学年選択
  def class_index 
  end 
  
  #クラス一覧
  def edit_1
    @schoolclassese_1 = Classnumber.where('class_name like ?','1-%').order(:class_name) 
    @class = Classnumber.where('class_name like ?','1-%').order(:class_name)
    @teachers = User.where(teacher: true)
  end
    
  def edit_2
    @schoolclassese_2 = Classnumber.where('class_name like ?','2-%').order(:class_name)
    @class = Classnumber.where('class_name like ?','2-%').order(:class_name)
    @teachers = User.where(teacher: true)
  end

  def edit_3 
    @schoolclassese_3 = Classnumber.where('class_name like ?','3-%').order(:class_name)
    @class = Classnumber.where('class_name like ?','3-%').order(:class_name)
    @teachers = User.where(teacher: true)
  end

  def edit_4
    @schoolclassese_4 = Classnumber.where('class_name like ?','4-%').order(:class_name)
    @class = Classnumber.where('class_name like ?','4-%').order(:class_name)
    @teachers = User.where(teacher: true)
  end

  def edit_5
    @schoolclassese_5 = Classnumber.where('class_name like ?','5-%').order(:class_name)
    @class = Classnumber.where('class_name like ?','5-%').order(:class_name)
    @teachers = User.where(teacher: true)
  end

  def edit_6
    @schoolclassese_6 = Classnumber.where('class_name like ?','6-%').order(:class_name)
    @class = Classnumber.where('class_name like ?','6-%').order(:class_name)
    @teachers = User.where(teacher: true)
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
      if params[:user][:schoolclasses][id][:contact_select] == "0" && contact.post_count == 0 
        contact.update(item.merge(contact_update: Time.current.change(sec: 0)))
        contact.increment!(:post_count, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_teacher_contact_index_user_url
      elsif params[:user][:schoolclasses][id][:contact_select] == "0" && contact.post_count > 0 
        contact.update(item.merge(before_post_count: contact.post_count, contact_update: Time.current.change(sec: 0)))
        contact.increment!(:post_count, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_teacher_contact_index_user_url
      elsif params[:user][:schoolclasses][id][:contact_select] == "1" && contact.post_count > 0
        contact.update(item.merge(title: nil, teacher_note: nil, post_count: 0))
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_edit_teacher_contact_user_path(@user, date: contact.contact_date)
      else    
        flash[:alert] = "失敗しました。" 
        render :teacher_contact_index   
      end
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
      if params[:user][:schoolclasses][id][:contact_select8] == "0" && contact.post_count3 == 0
        contact.update(item.merge(contact_update4: Time.current.change(sec: 0)))
        contact.increment!(:post_count3, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_teacher_contact_index_user_url(@user)
      elsif params[:user][:schoolclasses][id][:contact_select8] == "0" && contact.post_count3 > 0
        contact.update(item.merge(before_post_contact3: contact.post_count3, contact_update4: Time.current.change(sec: 0)))
        contact.increment!(:post_count3, 1)  
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_teacher_contact_index_user_url(@user)
      elsif params[:user][:schoolclasses][id][:contact_select8] == "1" && contact.post_count3 > 0
        contact.update(item.merge(school_contact_2: nil, post_count3: 0))
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_edit_teacher_contact_2_user_path(@user, date: contact.contact_date)
      else
        flash[:alert] = "失敗しました。" 
      end
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
      if params[:user][:schoolclasses][id][:contact_select2] == "0" && contact.contact_count1 == 0
        contact.update(item.merge(contact_update2: Time.current.change(sec: 0)))
        contact.increment!(:contact_count1, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_show_teacher_contact_user_url(current_user)
      elsif params[:user][:schoolclasses][id][:contact_select2] == "0" && contact.contact_count1 > 0
        contact.update(item.merge(before_contact1: contact.contact_count1, contact_update2: Time.current.change(sec: 0)))
        contact.increment!(:contact_count1, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_show_teacher_contact_user_url(current_user)
      elsif params[:user][:schoolclasses][id][:contact_select2] == "1" && contact.contact_count1 > 0
        contact.update(item.merge(school_contact: nil, contact_count1: 0)) 
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_teacher_contact_user_path(@user, date: contact.contact_date) 
      else
        flash[:alert] = "失敗しました。"
        render :show_teacher_contact 
      end
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
      if params[:user][:schoolclasses][id][:contact_select3] == "0" && contact.post_count2 == 0
        contact.update(item.merge(contact_update3: Time.current.change(sec: 0)))
        contact.increment!(:post_count2, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_show_teacher_contact_user_path(current_user) 
      elsif params[:user][:schoolclasses][id][:contact_select3] == "0" && contact.post_count2 > 0
        contact.update(item.merge(before_post_count2: contact.post_count2, contact_update3: Time.current.change(sec: 0)))
        contact.increment!(:post_count2, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_show_teacher_contact_user_path(current_user) 
      elsif params[:user][:schoolclasses][id][:contact_select3] == "1" && contact.post_count2 > 0
        contact.update(item.merge(title_2: nil, teacher_note_2: nil, post_count2: 0))
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_edit_teacher_contact_3_user_path(@user, date: contact.contact_date)
      else  
        flash[:alert] = "失敗しました。" 
      end
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
      if params[:user][:schoolclasses][id][:contact_select4] == "0" && contact.guardian_post_count1 == 0
        contact.update(item.merge(contact_update5: Time.current.change(sec: 0)))
        contact.increment!(:guardian_post_count1, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_index_teacher_contact_user_url(@user) 
      elsif params[:user][:schoolclasses][id][:contact_select4] == "0" && contact.guardian_post_count1 > 0
        contact.update(item.merge(before_guardian_postcount1: contact.guardian_post_count1, contact_update5: Time.current.change(sec: 0)))
        contact.increment!(:guardian_post_count1, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_index_teacher_contact_user_url(@user)
      elsif params[:user][:schoolclasses][id][:contact_select4] == "1" && contact.guardian_post_count1 > 0
        contact.update(item.merge(title_3: nil, guardian_note_1: nil, guardian_post_count1: 0))
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_edit_teacherwhat_contact_user_path(@user, date: contact.contact_date) 
      else
        flash[:alert] = "失敗しました。" 
      end
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
    @student = Student.find(params[:id])
    @contact_teacher = User.where(teacher: true, class_number: @student.class_belongs)
    @contact_title = @user.schoolclasses.where(contact_date: params[:date])
    @contacts = @user.schoolclasses.where(contact_date: params[:date])  
  end

  def update_teacherform_contact
    guardian_contact_2_params.each do |id,item|
      @student = Student.find(params[:id])
      contact = Schoolclass.find(id)
      if params[:user][:schoolclasses][id][:contact_select5] == "0" && contact.guardian_post_count2 == 0
        contact.update(item.merge(contact_class2: @student.class_belongs, contact_update6: Time.current.change(sec: 0)))
        contact.increment!(:guardian_post_count2, 1)
        redirect_to schoolclasses_index_guardian_contact_user_url(@user) 
      elsif params[:user][:schoolclasses][id][:contact_select5] == "0" && contact.guardian_post_count2 > 0
        contact.update(item.merge(before_guardian_postcount2: contact.guardian_post_count2, contact_update6: Time.current.change(sec: 0),
                          contact_class2: @student.class_belongs))
        contact.increment!(:guardian_post_count2, 1) 
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_index_guardian_contact_user_url(@user)
      elsif params[:user][:schoolclasses][id][:contact_select5] == "1" && contact.guardian_post_count2 > 0
        contact.update(item.merge(guardian_note_2: nil, guardian_post_count2: 0))
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_edit_teacherform_contact_user_path(@user, date: contact.contact_date)
      else
        flash[:alert] = "失敗しました。" 
      end
    end
  end
  
  #担任への連絡（保護者）
  def edit_guardianwhat_contact
    @contact = @user.schoolclasses.where(contact_date: params[:date])
    @teacher_contact = @user.schoolclasses.where(contact_date: params[:date])
  end

  def update_guardianwhat_contact
    guardian_contact_3_params.each do |id,item|
      @student = Student.find(params[:id])
      contact = Schoolclass.find(id)
      if params[:user][:schoolclasses][id][:contact_select6] == "0" && contact.guardian_post_count3 == 0
        contact.update(item.merge(contact_class: @student.class_belongs, contact_update7: Time.current.change(sec: 0)))
        contact.increment!(:guardian_post_count3, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_index_guardian_contact_user_url(@user)
      elsif params[:user][:schoolclasses][id][:contact_select6] == "0" && contact.guardian_post_count3 > 0
        contact.update(item.merge(before_guardian_postcount3: contact.guardian_post_count3, contact_update7: Time.current.change(sec: 0),
                      contact_class: @student.class_belongs))
        contact.increment!(:guardian_post_count3, 1) 
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_index_guardian_contact_user_url(@user)
      elsif params[:user][:schoolclasses][id][:contact_select6] == "1" && contact.guardian_post_count3 > 0
        contact.update(item.merge(title_4: nil, guardian_note_3: nil, guardian_post_count3: 0))
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_edit_guardianwhat_contact_user_path(@user, date: contact.contact_date)
      else
        flash[:alert] = "失敗しました。" 
      end
    end
  end

  #保護者への返信（担任）
  def edit_guardianform_contact
    @student = Student.find(params[:id])
    @contact_title = @user.schoolclasses.where(contact_date: params[:date])
    @contacts = @user.schoolclasses.where(contact_date: params[:date])
  end

  def update_guardianform_contact
    guardian_contact_4_params.each do |id,item|
      contact = Schoolclass.find(id)
      if params[:user][:schoolclasses][id][:contact_select7] == "0" && contact.guardian_post_count4 == 0
        contact.update(item.merge(contact_update8: Time.current.change(sec: 0)))
        contact.increment!(:guardian_post_count4, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_index_teacher_contact_user_url(@user) 
      elsif params[:user][:schoolclasses][id][:contact_select7] == "0" && contact.guardian_post_count4 > 0
        contact.update(item.merge(contact_update8: Time.current.change(sec: 0)))
        contact.increment!(:guardian_post_count4, 1)
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_index_teacher_contact_user_url(@user)
      elsif params[:user][:schoolclasses][id][:contact_select7] == "1" && contact.guardian_post_count4 > 0
        contact.update(item.merge(guardian_note_4: nil, guardian_post_count4: 0))
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_edit_guardianform_contact_user_path(@user, date: contact.contact_date)
      else
        flash[:alert] = "失敗しました。" 
      end
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
      if params[:user][:schoolclasses][id][:board_select] == "0"  
        contact.update(item.merge(board_class: @user.class_number, board_update: Time.current.change(sec: 0)))
        flash[:notice] = '投稿しました。'
        redirect_to schoolclasses_board_create_index_user_url(current_user)
      elsif params[:user][:schoolclasses][id][:board_select] == "1" 
        contact.update(item.merge(board_title: nil, contact_board: nil, image: :remove_image))
        flash[:notice] = "削除しました。"
        redirect_to schoolclasses_edit_class_board_user_path(@user, date: contact.contact_date) 
      else
        flash[:alert] = "失敗しました。" 
      end
    end
  end 
  
  #学級だより一覧（保護者）
  def guardian_board_index
    @student = Student.find(params[:id])
    @guardian_board = Schoolclass.where(board_class: @student.class_belongs).where.not(contact_board: nil).sort.reverse! 
  end

  #学級だより閲覧（保護者）
  def show_board
    @student = Student.find(params[:id])
    @news_board = Schoolclass.where(board_class: @student.class_belongs, contact_date: params[:date])
  end

  #学級だより一覧（管理者）
  def guardian_board_index2
    @guardian_board = Schoolclass.where.not(contact_board: nil).sort.reverse! 
  end

  def show_board2
    @news_board = Schoolclass.where(board_class: @user.class_number, contact_date: params[:date])
  end
  
  def destroy
    @contact = @user.Schoolclass.find(params[:id]) 
    @contact.destroy
    flash[:notice] = "#{@user.name}のデータを削除しました。"
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
      params.require(:user).permit(schoolclasses: [:board_title, :contact_board, :image, :remove_image])[:schoolclasses]
    end
end


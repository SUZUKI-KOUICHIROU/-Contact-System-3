class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  $days_of_the_week = %w{日 月 火 水 木 金 土}  
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def set_schoolclass
    @schoolclass = Schoolclass.find(params[:id])
  end
  
  def set_classnumber
    @classnumber = Classnumber.find(params[:id])
  end

  def set_student
    @student = Student.find(params[:id])
  end 
  
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    @user = User.find(params[:user_id]) if @user.blank?
    unless current_user
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to(root_url)
    end
  end

  def correct_guardian_user
    @student = Student.find(params[:id])
    unless user_signed_in? && current_user.id == @student.user_id
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to(root_url)
    end
  end
  
  def correct_administrator_user
    @student = Student.find(params[:id])
    unless user_signed_in? && current_user.id == @student.user_id || current_user.admin? || current_user.teacher? && current_user.class_number == @student.class_belongs
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to(root_url)
    end
  end

  def correct_teacherguardian_user
    @student = Student.find(params[:id])
    unless user_signed_in? && current_user.id == @student.user_id || current_user.teacher? && current_user.class_number == @student.class_belongs
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to(root_url)
    end
  end

  def correct_adminteacherguardian_user
    @user = User.find(params[:user_id]) if @user.blank?
    unless user_signed_in? && current_user || current_user.teacher? || current_user.admin?
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to(root_url)
    end 
  end
  
  # 管理者かどうか判定します。
  def admin_user
    unless current_user.admin?
      flash[:danger] = "管理者以外は閲覧・編集権限がありません。" 
    redirect_to root_url
    end
  end

  #担任権限  
  def teacher_user
    @user = User.find(params[:user_id]) if @user.blank?
    unless current_user && current_user.teacher?
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to(root_url)
    end
  end

  def correct_teacher_user
    @student = Student.find(params[:id])
    unless user_signed_in? && current_user.teacher? && current_user.class_number == @student.class_belongs
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to(root_url)
    end
  end

  #管理者または担任かどうか判定します。
  def admin_teacher_user
    unless current_user.admin? || current_user.teacher?
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to root_url
    end
  end

  def admin_teacheredit_user
    unless current_user.admin? || current_user.teacher? && current_user.id == @user.id
      flash[:danger] = "閲覧・編集権限がありません。"
      redirect_to root_url
    end
  end

  # クラスリスト
  def class_choice
    @class_list = Classnumber.all.order(:class_name)
  end
  
  # クラス選択（生徒登録）
  def class_select
    @user = User.find(params[:id])
    @class_select = User.where(class_number: @user.class_number)
  end

  # クラス作成
  def class_select
    @class_list = ["1-1", "1-2", "1-3", "1-4", "1-5", "2-1", "2-2", "2-3", "2-4", "2-5", "3-1", "3-2", "3-3", "3-4", "3-5",
                    "4-1", "4-2", "4-3", "4-4", "4-5", "5-1", "5-2", "5-3", "5-4", "5-5", "6-1", "6-2", "6-3", "6-4", "6-5",
                    "1-A", "1-B", "1-C", "1-D", "1-E", "2-A", "2-B", "2-C", "2-D", "2-E", "3-A", "3-B", "3-C", "3-D", "3-E"]
  end

  # ページ出力前に1ヶ月分のデータの存在を確認・セットします。
  def set_one_month 
    @first_day = params[:date].nil? ? Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day] # 対象の月の日数を代入します。
    # ユーザーに紐付く一ヶ月分のレコードを検索し取得します。
    @schoolclasses = @user.schoolclasses.where(contact_date: @first_day..@last_day).order(:contact_date)
    
    unless one_month.count == @schoolclasses.count # それぞれの件数（日数）が一致するか評価します。
      ActiveRecord::Base.transaction do # トランザクションを開始します。
      #繰り返し処理により、1ヶ月分の勤怠データを生成します。
        one_month.each { |day| @user.schoolclasses.create!(contact_date: day) }
      end
      @schoolclasses = @user.schoolclasses.where(contact_date: @first_day..@last_day).order(:contact_date)
    end

  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
    flash[:danger] = "ページ情報の取得に失敗しました、再アクセスしてください。"
    redirect_to root_url
  end


  private 
    def after_sign_in_path_for(resource)
      # ログイン後に遷移するpathを設定
      current_user
    end

    def after_sign_out_path_for(resource)
      # ログアウト後に遷移するpathを設定
      root_url 
    end
  
    def configure_permitted_parameters
      # 保護者アカウント編集
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :telephone_number, :class_number, :password, :password_confirmation])
    end
end
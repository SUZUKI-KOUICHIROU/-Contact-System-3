class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  $days_of_the_week = %w{日 月 火 水 木 金 土}
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def set_schoolclass
    @schoolclass = Schoolclass.find(params[:id])
  end
  
  # 管理者かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  #担任かどうか判定します。
  def teacher_user
    redirect_to root_url unless current_user.teacher?
  end

  #管理者または担任かどうか判定します。
  def admin_teacher_user
    redirect_to root_url unless current_user.admin? || current_user.teacher?
  end
  
  # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end  
    
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
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
end

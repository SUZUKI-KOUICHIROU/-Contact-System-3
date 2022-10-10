class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def line; basic_action end

  private
  def basic_action
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      @profile = User.find_or_initialize_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
      if @profile.email.blank?
        email = @omniauth["info"]["email"] ? @omniauth["info"]["email"] : "#{@omniauth["uid"]}-#{@omniauth["provider"]}@example.com"   
        @profile = current_user || User.create!(provider: @omniauth["provider"], uid: @omniauth["uid"], email: email, name: @omniauth["info"]["name"], password: "password")
      end
      @profile.set_values(@omniauth)
      sign_in(:user, @profile)
      end
      if current_user.password == "password"
        flash[:notice] = "ログインしました"
        flash[:alert] = "パスワードが初期設定のままです、パスワードを変更してください。"
        redirect_to root_path  
      else
        flash[:notice] = "ログインしました"
        redirect_to root_path  
      end
    end
    if current_user.password == "password"
      flash[:notice] = "ログインしました"
      flash[:alert] = "パスワードが初期設定のままです、パスワードを変更してください。"
      redirect_to root_path  
    else
      flash[:notice] = "ログインしました"
      redirect_to root_path  
    end
  end

  def fake_email(uid, provider)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end

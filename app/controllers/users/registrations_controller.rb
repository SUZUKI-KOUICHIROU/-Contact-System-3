# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  

  # GET /resource/sign_up
  def new
    @user = User.new
  end
  
  # POST /resource
  def create
    @user = User.new(guardian_params)
    if @user.save
      sign_in @user
      flash[:notice] = 'アカウント作成に成功しました。'
      redirect_to @user
    else
      flash[:alert] = '失敗しました。'
      render :new
    end
  end

  # GET /resource/edit
  def edit
    @class_list = Classnumber.all.order(:class_name)
  end

  # PUT /resource
  def update
    if @user.update(guardian_params)
      redirect_to current_user, notice: "保護者情報を更新しました。"
    else
      render :edit_guardian     
    end  
  end
  
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(_resource)
    current_user
  end
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
    def guardian_params
      params.require(:user).permit(:name, :email, :address, :telephone_number, :password, :password_confirmation)
    end
end

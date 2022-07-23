class AuthController < ApplicationController
  
  def index
    admin = Admin.find(params[:admin_id])

    state = User.new_token
    session[:state] = state
    redirect_to Line::Api::Oauth.new(admin).auth_uri(state)
  end
end











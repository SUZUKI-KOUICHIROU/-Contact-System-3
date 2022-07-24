class AuthController < ApplicationController
  
  def index
    admin = User.find(1)

    state = User.new_token
    session[:state] = state
    redirect_to Line::Api::Oauth.new(admin).auth_uri(state)
  end
end











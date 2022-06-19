class ClassnumbersController < ApplicationController

  before_action :admin_user, only: %i(new create)
  before_action :class_select, only: %i(new)   
  
  #クラス作成
  def new
    @classnumber = Classnumber.new
  end

  def create
    @classnumber = Classnumber.new(class_params)
    #@classnumber = current_user.classnumbers.build(class_params)
    if @classnumber.save
      flash[:success] = 'クラスを作成しました。'
    redirect_to current_user
    else
      render :new
    end
  end

  private

  def class_params
    params.require(:classnumber).permit(:class_name)
  end
end
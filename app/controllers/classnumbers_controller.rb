class ClassnumbersController < ApplicationController
  
  before_action :admin_user, only: %i(new)
  
  def new
    @classname = Classnumber.new
  end

  def create
    @classname = Classnumber.create(classname_params)
    if @classname.save
      flash[:success] = 'クラスを作成しました。'
      redirect_to current_user
    else
      render :new
    end
  end

  private

    def classname_params
      params.require(:classnumber).permit(:class_name)
    end
end
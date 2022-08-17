class ClassnumbersController < ApplicationController

  before_action :admin_user, only: %i(new create destroy)
  before_action :class_select, only: %i(new create)   
  
  #クラス作成
  def new
    @classnumber = Classnumber.new
  end

  def create
    @classnumber = Classnumber.new(class_params)
    #@classnumber = current_user.classnumbers.build(class_params)
    if @classnumber.save
      flash[:notice] = "クラス#{@classnumber.class_name}を作成しました。" 
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy 
    @class = Classnumber.find(params[:id]) 
    @class.destroy
    redirect_to schoolclasses_class_index_user_path(current_user), notice: "クラス#{@class.class_name}を削除しました。"
  end

  private

  def class_params
    params.require(:classnumber).permit(:class_name)
  end
end
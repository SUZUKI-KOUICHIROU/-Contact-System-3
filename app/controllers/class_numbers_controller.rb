class ClassNumbersController < ApplicationController

  def new
    @class_number = ClassNumber.new
  end

  def create
    @class_number = ClassNumber.create(class_number_params)
    if @class_number.save
      flash[:success] = 'クラスを作成しました。'
      redirect_to root_url
    else
      render :new
    end
  end

  private

    def class_number_params
      params.require(:class_number).permit(:class_name)
    end
end
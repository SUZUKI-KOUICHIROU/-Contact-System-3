class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.page(params[:page])
  end
end

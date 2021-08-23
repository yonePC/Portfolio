class NotificationsController < ApplicationController
  def index
    @notification = Notification.all
    @notifications = current_user.passive_notifications
    # @notifications.where(check: false).each do |notification|
    #   notification.update_attributes(check: true)
    # end
  end
end

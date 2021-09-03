class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.order("created_at DESC")
    @notifications.where(check: false).each do |notification|
      notification.update_attributes(check: true)
    end
  end
end

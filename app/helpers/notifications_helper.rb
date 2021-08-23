module NotificationsHelper
   def notification_form(notification)
      visiter = link_to notification.action_user.name, notification.action_user, style:"font-weight: bold;"
      your_post = link_to 'あなたの投稿', notification.post, style:"font-weight: bold;"


      # @action_user_comment = notification.comment_id
      @comment = Comment.find_by(id: notification.comment_id) #&.content
      "#{visiter}さんが#{your_post}にコメントしました。"
   end
   
   def unchecked_notifications
    @notifications = current_user.passive_notifications.where(check: false)
   end
end

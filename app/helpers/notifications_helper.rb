module NotificationsHelper
  def notification_form(notification)
    visiter = link_to notification.action_user.name, notification.action_user, style: "font-weight: bold;"
    your_post = link_to 'あなたの投稿', notification.post, style: "font-weight: bold;"

    "#{visiter}さんが#{your_post}にコメントしました。"
  end
end

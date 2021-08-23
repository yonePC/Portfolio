class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :stamps, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags


  def stamped_by?(user) # スタンプが押されているかの判定
    stamps.where(user_id: user.id).exists?
  end

  def datetime # 時刻表示のフォーマット
    created_at.strftime("%Y/%m/%d %H:%M")
  end

  def save_tags(savepost_tags) # タグ新規登録
    savepost_tags.each do |tag|
      post_tag = Tag.where(name: tag).first_or_create
      tags << post_tag
    end
  end

  def update_tags(updatepost_tags) # タグ編集
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - updatepost_tags
    new_tags = updatepost_tags - current_tags

    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      tags << post_tag
    end
  end
  
  def create_notification_comment!(current_user, comment_id)
    save_notification_comment!(current_user, comment_id, user_id)
  end
  
  def save_notification_comment!(current_user, comment_id, ationed_user_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      ationed_user_id: ationed_user_id,
      action: "comment"
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.action_user_id == notification.ationed_user_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end

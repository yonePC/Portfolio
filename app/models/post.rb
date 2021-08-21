class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :stamps, dependent: :destroy
  has_many :notifications
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
    self.tags << post_tag
    end
  end

  def update_tags(updatepost_tags) # タグ編集
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - updatepost_tags
    new_tags = updatepost_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag
    end
  end
end

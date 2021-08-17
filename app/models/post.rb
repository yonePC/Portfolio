class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :stamps, dependent: :destroy
  has_many :notifications
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  def datetime
    created_at.strftime("%Y/%m/%d %H:%M")
  end
end

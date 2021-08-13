class Post < ApplicationRecord
   belongs_to :users
   has_many :comments, dependent: :destroy
   has_many :stamps, dependent: :destroy
   has_many :notifications
   has_many :post_tags, dependent: :destroy
    has_many  :tags, through: :post_tags
   
end

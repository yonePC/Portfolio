class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy

  validates :body, presence: { message: "評価コメントを入力してください" }
  validates :rate, presence: { message: "星評価をつけてください" }
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy

  validates :body, presence: true
  validates :rate, presence: true

  def comment_pt
    (score.to_f * 10).round
  end
end

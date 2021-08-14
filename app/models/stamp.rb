class Stamp < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  has_many :notifications
end

class Notification < ApplicationRecord
  
  
  belongs_to :posts
  belongs_to :comments
  belongs_to :stamps
end

class Notification < ApplicationRecord
  
  
  belongs_to :post
  belongs_to :comment
  belongs_to :stamp
end

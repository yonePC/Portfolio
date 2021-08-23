class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :stamp, optional: true
  belongs_to :action_user, class_name: "User", foreign_key: "action_user_id", optional: true
  belongs_to :ationed_user, class_name: "User", foreign_key: "ationed_user_id", optional: true
end

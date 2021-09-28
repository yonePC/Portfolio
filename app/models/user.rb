class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :stamps, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "action_user_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "ationed_user_id", dependent: :destroy

  validates :name, presence: { message: "名前を入力してください" }
  validates :number, numericality: { message: "社員番号は数値で入力してください" }
  # validates :email, presence: { message: "メールを入力してください" }
  # validates :password, presence: { message: "パスワードを入力してください" }
end

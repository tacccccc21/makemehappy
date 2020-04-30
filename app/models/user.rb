class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_many :likes
  has_many :like_tweets, through: :likes, source: :tweet

    # ユーザー画像を関連付け
    mount_uploader :avatar, AvatarUploader
end

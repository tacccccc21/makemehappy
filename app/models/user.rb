class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet
  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
  has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships

    # ユーザー画像を関連付け
    mount_uploader :avatar, AvatarUploader

  
  
    
end

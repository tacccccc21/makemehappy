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

    # ユーザー画像を関連付け
    mount_uploader :avatar, AvatarUploader

  # フォロー機能
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

  has_many :followings, through: :following_relationships
 
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
 
  has_many :followers, through: :follower_relationships
 
   def following?(other_user)
     following_relationships.find_by(following_id: other_user.id)
   end
 
   def follow!(other_user)
     following_relationships.create!(following_id: other_user.id)
   end
 
   def unfollow!(other_user)
     following_relationships.find_by(following_id: other_user.id).destroy
   end

    
end

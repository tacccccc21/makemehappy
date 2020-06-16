class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :text, :star, :image, presence: true
  
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  # has_many :likes, dependent: :destroy
  # def like_user(user_id)
  #   likes.find_by(user_id: user_id)
  # end
  
  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end
end

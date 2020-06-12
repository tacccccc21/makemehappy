class UsersController < ApplicationController
  def show
    user= User.find(params[:id])
    @avatar = user.avatar
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(10).order("created_at DESC")
    @likes = Like.where(tweet_id: @tweet).all
  end

  # def likes
  #   @tweet = Tweet.find(params[:id])
  #   @likes = Like.where(tweet_id: @tweet.id).all
  # end
end

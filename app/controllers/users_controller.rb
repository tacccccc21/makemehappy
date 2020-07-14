class UsersController < ApplicationController
  def show
    user= User.find(params[:id])
    @avatar = user.avatar
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(10).order("created_at DESC")
    @likes = Like.where(tweet_id: @tweet).all
    
  end
end

class UsersController < ApplicationController
  def show
    user= User.find(params[:id])
    @avatar = user.avatar
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(10).order("created_at DESC")
    @likes = Like.where(tweet_id: @tweet).all
  end


  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
   end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  render 'show_follower'
  end
end

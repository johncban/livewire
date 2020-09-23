class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    redirect_to new_user_registration
  end

  def show
    #@user = User.find(params[:id])
    #@posts = Post.find_by(params[:id])
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id], published: true)
    @followers = @user.followers
    @followees = @user.followees
    @friends = @user.friends
  end


  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    @posts = Post.all
    redirect_to new_user_registration
  end

  def show
    find_user
    @posts = Post.where(user_id: params[:id], published: true)
    @followers = @user.followers
    @followees = @user.followees
    @friends = @user.friends
  end

  def follow
    find_user
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    find_user
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  def render_404
    redirect_to :root, error: 'User Not Available'
  end


  private

  def find_user
    @user = User.find(params[:id])
  end


end

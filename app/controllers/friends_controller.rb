class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_signed_in?
    c_user
    @friends = @user.friends
    @requests = @user.requested_friends
    @pending = @user.pending_friends
  end

  def create
    c_user
    friend = find_by_user
    @user.friend_request(friend)
    redirect_to friends_path
  end

  def add
    c_user
    friend = find_by_user
    @user.accept_request(friend)
    redirect_to friends_path
  end

  def remove
    c_user
    friend = find_by_user
    @user.decline_request(friend)
    redirect_to friends_path
  end

  def delete
    c_user
    friend = find_by_user
    @user.remove_friend(friend)
    redirect_to user_path(friend)
  end

  def search
    @search = params[:search].to_s.downcase.gsub(/\s+/, '')
    @results = User.all.select do |user|
      user.name.downcase.include?(@search)
    end
  end


  private

  def find_by_user 
    User.find_by(id: params[:id])
  end

  def c_user
    @user = current_user
  end
end

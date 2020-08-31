class UsersController < ApplicationController
    before_action :authenticate_user!

    def show 
        @user = User.find(params[:id])
        @followers = @user.followers
        @followees = @user.followees
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

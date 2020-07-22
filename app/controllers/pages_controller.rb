class PagesController < ApplicationController
  #before_action :authenticate_user!

  def main
  end

  def home
    if current_user
      @user_name = current_user.name
      @created_date = current_user.created_at
    end
  end
end

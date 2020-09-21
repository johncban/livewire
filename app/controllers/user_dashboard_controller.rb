class UserDashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
    @post = Post.all
    @appointment = Appointment.all

    @topic = 'BREAKING NEWS'

    @news_key = ENV['NEWS_API_KEY']

    url = "https://newsapi.org/v2/everything?q=#{@topic}&sortBy=publishedAt&apiKey=#{@news_key}"

    resp = Net::HTTP.get_response(URI.parse(url))
    @data = JSON.parse(resp.body)
    @news_count = @data['articles'].size
  end

  def show
    @post = Post.find_by(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to :posts, info: 'Post Deleted'
    else
      redirect_to :posts, error: 'Not Authorized!'
    end
  end
end

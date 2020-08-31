class UserDashboardController < ApplicationController
    before_action :authenticate_user!

    def show 
        @user = User.find(params[:id])
        @appointment = Appointment.find(params[:id])
    end

    def index
        @user = User.all
        @appointment = Appointment.all
        
        @stat = "New Jersey Breaking News"

        @news_key = ENV["NEWS_API_KEY"]

        url = "https://newsapi.org/v2/everything?q=#{@stat}&apiKey=#{@news_key}"
        resp = Net::HTTP.get_response(URI.parse(url))
        @data = JSON.parse(resp.body)
        @news_count = @data["articles"] .size
    end

end

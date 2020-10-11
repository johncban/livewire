require 'open_weather'

class UserDashboardController < ApplicationController
  before_action :authenticate_user!



  def index
    @user = User.all
    @post = Post.all
    @appointment = Appointment.all
    @news_key = ENV['NEWS_API_KEY']
    
    getIP
    getWeather

    @country = @ipdata["country_code"]

    url = "https://newsapi.org/v2/top-headlines?country=#{@country}&sortBy=publishedAt&apiKey=#{@news_key}"

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



  private

  def getIP
    url = URI("https://freegeoip.app/json/")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["content-type"] = 'application/json'

    response = http.request(request)
    @ipdata = JSON.parse(response.body)
  end

  def getWeather
    lat = @ipdata["latitude"]
    lon = @ipdata["longitude"]

    options = { units: "imperial", APPID: ENV['OWM_API_KEY'] }
    weather_info = OpenWeather::Current.geocode(lat, lon, options)

    dat = weather_info.to_json
    @current_w = JSON.parse(dat)
  end

end

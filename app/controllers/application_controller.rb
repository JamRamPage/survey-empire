class ApplicationController < ActionController::Base
  before_action :set_variables
  def set_variables
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "JpWF5sOznMfyqtF74aw2BMBeB"
      config.consumer_secret     = "eVVDRHaFKkT5WSfkQNBhX6fFmCqZWb1JKO2KPYV2Vac7gN47Q0"
      config.access_token        = "2557051825-3vqdekY5uytYplukRULjfGHD01tScbu49nYSBon"
      config.access_token_secret = "vXVYfbCVuResU3LDlD7e4J0ztS4EhQswWmOEzDtCZcyh3"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end

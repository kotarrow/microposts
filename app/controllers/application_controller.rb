class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in? #ユーザーがログインしているとtrueを返す
      store_location  #元いたURLを保持
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
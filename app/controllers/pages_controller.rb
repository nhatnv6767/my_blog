class PagesController < ApplicationController
  def home
    # chuyen huong nguoi dung neu ho da dang nhap hoac chua dang nhap
    redirect_to articles_path if logged_in?
  end
end
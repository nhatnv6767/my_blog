class ApplicationController < ActionController::Base

  # de co the su dung o articles_controller.rb
  helper_method :current_user, :logged_in?
  def current_user
    # if session[:user_id] then User.find(session[:user_id]), it mean, if not nil
    # find this
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end

  def logged_in?
    #boolean
    !!current_user
  end

end

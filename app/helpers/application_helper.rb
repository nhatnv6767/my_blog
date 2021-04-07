module ApplicationHelper

  # http://en.gravatar.com/site/implement/images/ruby/
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

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

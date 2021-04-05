class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # sử dụng đối tượng phiên này và lưu trữ một số thông tin về người dùng mà chúng ta muốn theo dõi khi đã
      # đăng nhập,
      # https://guides.rubyonrails.org/action_controller_overview.html#session
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      # không chuyển hướng mà chỉ hiển thị lỗi
      # nếu dùng flash thì khi xuất hiện lỗi, và di chuyển qua articles or somewhere, thông báo sẽ hiển thị lại.
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
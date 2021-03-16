class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # Đưa các thông số vào danh sách trắng
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
  # tương tự như ở articles_controller
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
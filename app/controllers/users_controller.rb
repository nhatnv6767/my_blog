class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    # @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)

  end

  def new
    @user = User.new
  end

  def edit
    # @user = User.find(params[:id])
  end


  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def create
    # Đưa các thông số vào danh sách trắng
    @user = User.new(user_params)
    if @user.save
      # để chắc chắn khi người dùng đăng ký mới xong được lưu lại session
      # ex: Khi co mot user moi sign up vao he thong, se hien thi thong tin cua nguoi do
      # tuc thi
      session[:user_id] = @user.id
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

  def set_user
    @user = User.find(params[:id])
  end

end
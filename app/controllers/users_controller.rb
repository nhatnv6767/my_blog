class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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

  def destroy
    @user.destroy
    # cần lưu ý là khi xoá user, cần phải xoá mọi liên kết có từ id của user đó
    # và khi là admin thực hiện lệnh xoá account thì không set nil cho id của admin
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
  end

  private
  # tương tự như ở articles_controller
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Khi dang nhap bang user nao thi chi edit update dc moi user do
  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end

end
class ArticlesController < ApplicationController

  # Nghĩa là trước khi làm bất cứ thứ gì, ở đây có only nghĩa là chỉ riêng cho những def đó
  # tức là trước khi những def kia được định nghĩa, nó sẽ lấy giá trị trong def set_article trước rồi mới
  # làm những hành động trong def của ta
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # tương tự như trong console ta làm là article = Article.find(1) or (2)
    # sau đó muốn truy cập đến các phần tử article.title or article.description
    # this is only availble for this method show,
    # Để làm cho biến này có sẵn cho bên phần view hoặc các phần khác, ta phải biến nó trở thành
    # một instance variable để có thể sử dụng ở nhiều chỗ -> thêm @ vào trước article
    # @ biến 1 biến bình thường trở thành biến instance
    # byebug: use to debug
    # byebug

  end

  def index
    @articles = Article.all
  end

  def new
    # Để khởi tạo giá trị đầu tiên cho instance @article
    # Nếu không khởi tạo, khi vào trang /new kết hợp với code check đầu ở new.html.erb sẽ gây lỗi
    # vì chưa có instance @article mà lại đi check nó, -> wrong
    @article = Article.new

  end

  def edit

    # Để có thể có id của filed cần chỉnh sửa


  end

  # sau khi đã có thông tin từ form "new", ta hứng các giá trị đó
  def create
    @article = Article.new(article_params)
    # hien thi thong tin chi tiet ra
    # render plain: @article.inspect
    if @article.save
      # flash for message success
      flash[:notice] = "Article was created successfully."
      # ở rails routes --expanded ta thấy Prefix article, đó là lý do vì sao có article_path
      # nó sẽ trích xuất id từ @article, và sau đó sử dụng nó để tạo đường dẫn
      # thường được sử dụng nếu ta chỉ chuyển hướng đơn giản là tại article ngay tại đây
      # redirect_to article_path(@article)
      # nên để viết ngắn hơn ta có thể dùng như dưới
      redirect_to @article

    else
      # Khi lưu không thành công sẽ trở lại trang new để thêm lại mẫu
      # và các thông báo sẽ chuyển đến đây, thông báo lỗi
      render 'new'
    end
  end

  def update

    # đầu tiên cần phải tìm cái article cần sửa đó

    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      # nếu có lỗi xảy ra quay lại form chỉnh sửa
      render 'edit'
    end
  end

  def destroy

    @article = Article.find(params[:id])
    @article.destroy
    # show up
    redirect_to articles_path
  end

  # vì có những nơi bị lặp code, ta sử dụng phương pháp dưới đây để tránh điều đó, private nghĩa là trong
  # phạm vi file .rb này mới được sử dụng
  # không cần end kết thúc cho private, tự hiểu là những giá trị từ sau private đều là private
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
class ArticlesController < ApplicationController

  def show
    # tương tự như trong console ta làm là article = Article.find(1) or (2)
    # sau đó muốn truy cập đến các phần tử article.title or article.description
    # this is only availble for this method show,
    # Để làm cho biến này có sẵn cho bên phần view hoặc các phần khác, ta phải biến nó trở thành
    # một instance variable để có thể sử dụng ở nhiều chỗ -> thêm @ vào trước article
    # @ biến 1 biến bình thường trở thành biến instance
    # byebug: use to debug
    # byebug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def create
    # hien thi ra man hinh ngay luc an nut submit
    render plain: params[:article]
  end

end
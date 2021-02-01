class AddTimestampsToArticles < ActiveRecord::Migration[6.1]
  def change
    # thêm cột vào bảng hiện có, đối số đầu tiên là tên của table
    # đối số thứ 2 sẽ là tên thuộc tính (attribute name)
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end

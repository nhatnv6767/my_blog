class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    # thêm vào users một cột admin, có giá trị là boolean, mặc định là false
    add_column :users, :admin, :boolean, default: false
  end
end

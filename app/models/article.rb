class Article < ApplicationRecord
  # validate giá trị title, presence nghĩa là tiêu đề có sẵn có bất kỳ Article, nghĩa là
  # từ giờ nếu title = nil sẽ không thể thực hiện lệnh save được nữa
  validates :title, presence: true, length: { minimum: 6, maximum: 100}
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
class User < ApplicationRecord
  before_save { self.email = email.downcase}
  # dependent: sau khi xoá người dùng, dùng destroy thì các bài viết liên quan của user đó cũng sẽ bị xoá
  has_many :articles, dependent: :destroy
  # true: đảm bảo tên người dùng được presence trước khi một đối tượng người dùng được lưu vào CSDL
  # uniqueness check nếu như trùng tên username bao gồm cả viết hoa và viết thường
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX}
  has_secure_password
end



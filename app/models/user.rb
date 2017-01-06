class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  validates :email, uniqueness: true
  has_many :comments, dependent: :destroy
end

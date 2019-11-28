class AdminUser < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :username, presence: true
  validates :email, uniqueness: true
end

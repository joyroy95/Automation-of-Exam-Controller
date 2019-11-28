class User < ApplicationRecord
  belongs_to :department, foreign_key: :departments_id
  self.primary_key = "id"
  validates(:id, presence: true, uniqueness: {case_sensitive: false})
  before_save{ self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, presence: true)
  validates(:email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false})
  has_secure_password
  validates(:password, presence:true, length: {minimum: 6})
  belongs_to :department, foreign_key: :departments_id
end

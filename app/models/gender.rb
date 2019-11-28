class Gender < ApplicationRecord
  include GenderObject
  has_many :personal_info
end

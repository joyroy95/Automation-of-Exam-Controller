class Department < ApplicationRecord
  has_many :user
  has_and_belongs_to_many :courses
  has_many :registration
  has_many :batches
  include NamedObject

  scope :sorted, -> { order(name: :asc) }
  validates :name, presence: true
end

class Registration < ApplicationRecord
  has_many :degree, foreign_key: :degrees_id
  has_many :exam_status, foreign_key: :exam_statuses_id
  has_many :term, foreign_key: :terms_id
end

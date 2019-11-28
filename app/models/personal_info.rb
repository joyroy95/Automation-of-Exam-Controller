class PersonalInfo < ApplicationRecord
  #include Gender
  belongs_to :hall, foreign_key: :halls_id
  belongs_to :gender, foreign_key: :genders_id
  belongs_to :batch, foreign_key: :batches_id
end

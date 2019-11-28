class TermType < ApplicationRecord
  include NamedObject
  has_many :batches
  has_many :registration
end

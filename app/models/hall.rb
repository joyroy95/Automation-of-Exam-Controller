class Hall < ApplicationRecord
  has_many :personal_info
  include NamedObject
  #include Gender


  # It sends the first record whose column's value matched partially with provided `value`
  def self.find_by_matching(column, value)
    where("#{column} ILIKE '%#{value}%'").first;
  end
end

class CourseType < ApplicationRecord
  has_many :courses
  has_many :mark_distributions
  has_many :course_type_rules

  before_save :parameterize_name

  validates :name,
            presence: true,
            length: { minimum: 3 },
            uniqueness: { message: 'already defined', case_sensitive: false }

  # return titleized name
  alias_attribute :course_type_name, :titleized

  def parameterize_name
    self.name = name.parameterize(separator: '_').to_s if self.name
  end

  def titleized
    name.titleize
  end
end

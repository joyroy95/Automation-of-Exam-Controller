class Course < ApplicationRecord
  belongs_to :batch, inverse_of: :courses
  belongs_to :course_type

  # get delegated methods
  delegate :name,  :year?, :semester?, to: :batch, prefix: true, allow_nil: true
  delegate :name, to: :course_type, prefix: true, allow_nil: true
  validates :batch, :course_type, :term, :code, :name, :credit,
            presence: { message: "can't be blank" }
  validates :code, uniqueness: {
    scope: :batch_id,
    message: 'already assigned to another course' }
  validates :name, uniqueness: {
    scope: :batch_id,
    message: 'already assigned to another course', case_sensitive: false }

  #scope :sorted_by_code, -> { select("courses.*, split_part(courses.code, ' ', 2) as scode").order('scode asc') }
  scope :of_term, -> (term) { where(term: term) }
  scope :of_batch, -> (batch) { where(batch: batch) }

  def course_type_rule
    @course_type_rule ||= CourseTypeRule.of_course(self)
  end

  def mark_types
    mark_distribution.mark_types
  end

  def non_written_mark_types
    mark_types.where.not(id: answer_sheet_mark_type.id)
  end

  # Returns a scoped MarkDistribution collection
  def mark_distribution
    batch_mark_distributions.of_course_type(course_type_id)
  end

  def non_written_mark_distribution
    mark_distribution.where.not(mark_type: answer_sheet_mark_type)
  end

  def term_ordinal
    term.ordinalize
  end

  def full_marks
    credit * NUMBER_PER_CREDIT
  end

  # Return titleized course type
  def course_type_title
    course_type.titleized
  end

  def has_written?
    course_type_rule.has_written?
  end

  def has_improve?
    course_type_rule.has_improve?
  end

  def description
    "#{code}: #{credit} credit, #{full_marks} marks"
  end

  # Is this a project course?
  def project?
    course_type_name == "project"
  end

  def to_s
    code + " " + name
  end
end

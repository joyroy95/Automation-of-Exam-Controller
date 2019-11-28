class Batch < ApplicationRecord
  belongs_to :degree
  belongs_to :department
  has_many :courses, dependent: :destroy
  has_many :personal_info

  enum :term_type => { :year => 1, :semester => 2 }

  # get some delegated methods
  delegate :name, to: :department, prefix: true
  delegate :name, :short_name, to: :degree, prefix: true
  # get :count methods easily
  delegate :count, to: :courses, prefix: true

  validates :degree_id, uniqueness: {
                          scope: :session,
                          message: ': A batch already exists for the selected degree in the desired session'
                        }
  validates :session, presence: true
  validates :session, numericality: { only_integer: true }, allow_nil: true
  validates :session, format: { with: /\A[0-9]{4}\Z/, message: 'is in invalid format' }

  before_save :set_name

  scope :sorted, ->(order = :asc) { order(:session => order) }
  scope :newest_first, -> { order(session: :desc) }

  # returns the batch from next session of the same degree

  def total_terms
    @total_terms = exam_per_year * total_length_in_year
  end

  def term_type_name
    term_type.titleize
  end


  def defined_rules_for_all_course_types
    course_types.all? { |ct| course_type_rules_course_types.include?(ct) }
  end

  # Summation sheet is called average sheet for year type
  def report_names
    Constants::REPORTS.collect do |name|
      name = 'AVERAGE' if name == 'SUMMATION' and year?
      name.titleize
    end
  end

  def session_name
    "#{session}-#{session + 1 unless session.nil?}"
  end

  alias batch_id id # to be passed in to methods requires :batch_id

  def exam_per_year
    year? ? 1 : 2
  end

  private

  def course_type_rules_course_types
    @course_type_rules_course_types ||= course_type_rules.course_types
  end

  def set_name
    self.name = "#{degree.short_name} #{session_name} #{department.short_name}"
  end

  def next_session
    session + 1
  end
end

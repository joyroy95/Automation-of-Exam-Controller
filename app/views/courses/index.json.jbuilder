json.array!(@courses) do |course|
  json.extract! course, :id, :code, :name, :course_type_id, :batch_id, :term, :is_major, :is_optional, :credit, :created_at, :updated_at
  json.url course_url(course, format: :json)
end

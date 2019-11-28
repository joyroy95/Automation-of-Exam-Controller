xml.div(class: 'courselist') do
  xml.timestamp(Time.now)

  @courses.each do |course|
    xml.course do
      xml.coursecode(course.code)
      xml.coursename(course.name)
      xml.coursetype(course.course_type_name)
      xml.credit(course.credit)
      xml.major(course.is_major)
      xml.optional(course.is_optional)
      xml.term(course.term.ordinalize)
    end
  end
end
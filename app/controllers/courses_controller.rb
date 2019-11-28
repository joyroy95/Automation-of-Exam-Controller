class CoursesController < ApplicationController
  before_action :find_batch

  def index
    @courses = @batch.courses
    respond_to do |format|
      format.html
      format.xml
      format.js
      format.json { render json: @courses }
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    store_referrer
    @course = Course.new(code: '', name: '')
  end

  def create
    @course = Course.new(course_params)
    @course.batch = @batch

    if @course.save
      flash[:success] = 'Course Saved Successfully.'
      redirect_to batch_courses_path
    else
      render('new')
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      flash[:success] = 'Course Updated Successfully.'
      redirect_to batch_courses_path
    else
      render('edit', :id => @course.id)
    end
  end

  def delete
    @course = Course.find(params[:id])
  end

  def destroy
    course = Course.find(params[:id])
    if course.destroy
      flash[:success] = 'Course deleted Successfully.'
      redirect_to batch_courses_path
    end
  end

  private
    def apply_filter_if_requested
      @courses = @courses.of_term(params[:term]).includes(:course_type) if params[:term].present?
    end

    def course_params
      # batch_id is exempted from mass assignment, since it is assigned in
      # create action
      params.require(:course).permit(
        :code, :name, :credit,
        :course_type_id, :is_major, :is_optional, :term)
    end

    def find_batch
      if params[:batch_id]
        @batch = Batch.find(params[:batch_id])
      end
    end
end

class CourseTypesController < ApplicationController
  before_action :find_course_type, only: [:edit, :update, :destroy]

  #include AppropriateBreadcrumb

  def index
    @course_types = CourseType.all
  end

  def new
    @course_type = CourseType.new
    store_referrer
    respond_to do |format|
      format.html
      format.json { render json: @resource }
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js { render 'new' }
    end
  end

  def create
    @course_type = CourseType.new(course_type_params)
    if @course_type.save
      respond_to do |format|
        flash[:success] = 'Successfully Created'
        format.html { return_to_referrer_or course_types_path }
        format.js do
          flash.keep(:success)
          render js: "window.location = '#{session.delete(:return_to)}'"
        end
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js { render 'new' }
      end
    end
  end

  def update
    if @course_type.update(course_type_params)
      respond_to do |format|
        flash[:success] = 'Successfully updated'
        format.html { redirect_to course_types_path }
        format.js do
          flash.keep(:success)
          render js: "window.location = '#{course_types_path}'"
        end
        format.json { render json:  { status: :ok, message: 'Successfully updated' } }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.js { render 'new' }
        format.json { render json: { status: :unprocessable_entity, message: @course_type.errors.full_messages }  }
      end
    end
  end

  def destroy
    if @course_type.destroy
      redirect_to course_types_path, success: 'Successfully deleted'
    end
  end
  private

    def find_course_type
      @course_type = CourseType.find(params[:id])
    end

    def course_type_params
      params.require(:course_type).permit(:name)
    end
end

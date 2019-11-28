class PersonalInfosController < ApplicationController
  before_action :set_personal_info, only: [:show, :edit, :update, :destroy]

  # GET /personal_infos
  # GET /personal_infos.json
  def index
    @user = User.find(session[:user_id])
    @personal_info = PersonalInfo.find_by(users_id: session[:user_id])
    if !@personal_info.nil?
      @hall = Hall.find(@personal_info.halls_id)
    end
  end

  # GET /personal_infos/1
  # GET /personal_infos/1.json
  def show
    @user = User.find(session[:user_id])
    @personal_info = PersonalInfo.find_by(users_id: session[:user_id])
    if !@personal_info.nil?
      @hall = Hall.find(@personal_info.halls_id)
    end
  end

  # GET /personal_infos/new
  def new
    @params = params[:format]
    logger.debug "post: #{@params}"
    @personal_info = PersonalInfo.new()
    @batch = Batch.new
  end

  # GET /personal_infos/1/edit
  def edit
  end

  # POST /personal_infos
  # POST /personal_infos.json
  def create
    @personal_info = PersonalInfo.new(personal_info_params)
    respond_to do |format|
      if @personal_info.save
        format.html { redirect_to students_login_path, notice: 'Personal info was successfully created.' }
        format.json { render :show, status: :created, location: @personal_info }
      else
        format.html { render :new }
        format.json { render json: @personal_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_infos/1
  # PATCH/PUT /personal_infos/1.json
  def update
    @personal_info = PersonalInfo.find(params[:id])
    @personal_info.assign_attributes(personal_info_params)
    @user = User.find(session[:user_id])
    @personal_info.users_id = session[:user_id]

    if @personal_info.save
      respond_to do |format|
        success = 'Student info updated successfully'
        format.html { redirect_to @user, success: success }
        format.json { render json: {status: :ok, message: success} }
      end
    else
      respond_to do |format|
        format.html { render('edit') }
        format.json { render json: { status: :unprocessable_entity, message: @student.errors.full_messages } }
      end
    end
  end

  # DELETE /personal_infos/1
  # DELETE /personal_infos/1.json
  def destroy
    @personal_info.destroy
    respond_to do |format|
      format.html { redirect_to personal_infos_url, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_info
      @personal_info = PersonalInfo.find_by(users_id: session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_info_params
      params.require(:personal_info).permit(:fathers_name, :mothers_name, :halls_id,  :date_of_birth, :address, :phone_number, :genders_id, :users_id, :batches_id)
    end
end

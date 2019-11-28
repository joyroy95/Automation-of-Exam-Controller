class SubmittedController < ApplicationController
  before_action :find_batch
  before_action :find_term

  # GET /submitted_exam_regis_forms
  # GET /submitted_exam_regis_forms.json
  def index
    @registrations = Registration.where(batches_id: @batch.id)
    @terms = Term.all
  end

  # GET /submitted_exam_regis_forms/1
  # GET /submitted_exam_regis_forms/1.json
  def show
    @registrations = Registration.where(batches_id: @batch.id, terms_id: params[:id])
  end

  # GET /submitted_exam_regis_forms/new
  def new
    @submitted_exam_regis_form = SubmittedExamRegisForm.new
  end

  # GET /submitted_exam_regis_forms/1/edit
  def edit
  end

  # POST /submitted_exam_regis_forms
  # POST /submitted_exam_regis_forms.json
  def create
    @submitted_exam_regis_form = SubmittedExamRegisForm.new(submitted_exam_regis_form_params)

    respond_to do |format|
      if @submitted_exam_regis_form.save
        format.html { redirect_to @submitted_exam_regis_form, notice: 'Submitted exam regis form was successfully created.' }
        format.json { render :show, status: :created, location: @submitted_exam_regis_form }
      else
        format.html { render :new }
        format.json { render json: @submitted_exam_regis_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submitted_exam_regis_forms/1
  # PATCH/PUT /submitted_exam_regis_forms/1.json
  def update
    respond_to do |format|
      if @submitted_exam_regis_form.update(submitted_exam_regis_form_params)
        format.html { redirect_to @submitted_exam_regis_form, notice: 'Submitted exam regis form was successfully updated.' }
        format.json { render :show, status: :ok, location: @submitted_exam_regis_form }
      else
        format.html { render :edit }
        format.json { render json: @submitted_exam_regis_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submitted_exam_regis_forms/1
  # DELETE /submitted_exam_regis_forms/1.json
  def destroy
    @submitted_exam_regis_form.destroy
    respond_to do |format|
      format.html { redirect_to submitted_exam_regis_forms_url, notice: 'Submitted exam regis form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submitted_exam_regis_form
      @submitted_exam_regis_form = SubmittedExamRegisForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submitted_exam_regis_form_params
      params.fetch(:submitted_exam_regis_form, {})
    end
    def find_batch
      if params[:batch_id]
        @batch = Batch.find(params[:batch_id])
      end
    end
    def find_term
      if params[:id]
        @term = Term.find(params[:id])
      end
    end
end

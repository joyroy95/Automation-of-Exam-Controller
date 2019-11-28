class BatchesController < ApplicationController
  before_action :find_batch, only: [:edit, :update, :delete, :destroy]

  #include AppropriateBreadcrumb

  def index
    if params[:batch_id].present?
      @batches = Batch.where(id: params[:batch_id])
    else
      @batches = Batch.all
    end

    # Present in sorted order
    @batches = @batches.sorted
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)

    if @batch.save
      flash[:success] = 'Batch saved successfully'
      redirect_to batches_path
    else
      render('new')
    end
  end

  def edit
  end

  def update
    if @batch.update_attributes(batch_params)
      flash[:success] = 'Batch updated successfully'
      redirect_to @batch
    else
      render('edit', id: @batch.id)
    end
  end

  def delete
  end

  def destroy
    if @batch.destroy
      flash[:success] = 'Batch deleted successfully'
      redirect_to batches_path
    end
  end

  private

    def find_batch
      @batch = Batch.find(params[:id])
    end

    def batch_params
      params.require(:batch).permit(:name, :department_id, :degree_id, :term_type_id,
        :total_credit, :total_length_in_year, :session)
    end

end

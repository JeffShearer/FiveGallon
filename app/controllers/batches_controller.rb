class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @batches = current_user.batches.all
  end


  def show
  end

  def new
    @batch = current_user.batches.build
  end

  def edit
  end


  def create
    @batch = current_user.batches.build(batch_params)
    if @batch.save
      redirect_to batches_url, notice: 'Batch was successfully created.'
    else
      render :new
    end
  end

  def update
    if @batch.update(batch_params)
      redirect_to batches_url, notice: 'Batch was successfully updated.' 
    else
      render :edit

    end
  end


  def destroy
    @batch.destroy
    redirect_to batches_url
  end

  private
    def set_batch
      @batch = Batch.find(params[:id])
    end

    def correct_user
      @batch = current_user.batch.find_by(id: params[:id])
      redirect_to batches_path, notice: "Not authorized to edit this batch" if @batch.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:description, :name, :recipe_id)
    end
end

class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  def index
    #First you retrieve the recipe thanks to params[:recipe_id]
    recipe = Recipe.find(params[:recipe_id])
    #Next you get all the batches that use this recipe.
    @batches = recipe.batches
  end


  def show
    #first you retrieve the recipe thanks to params[:recipe_id]
    recipe = Recipe.find(params[:recipe_id])
    #Next you retrieve the batch thanks for params[:id]
    @batch = recipe.batches.find(params[:id])
  end

  def new
    #first you retrieve the recipe thanks to params[:recipe_id]
    recipe = Recipe.find(params[:recipe_id])
    @batch = recipe.batches.build


  end

  def edit
    #first you retrieve the recipe thanks to params[:recipe_id]
    recipe = Recipe.find(params[:recipe_id])
    @batch = recipe.batches.find(params[:id])
  end


  def create
    #first you retrieve the recipe thanks to params[:recipe_id]
    recipe = Recipe.find(params[:recipe_id])
    user = current_user
    @batch = recipe.batches.new(batch_params)
    if @batch.save
      redirect_to recipe_batches_url, notice: 'Batch was successfully created.'
    else
      render :new
    end
  end

  def update
    #first you retrieve the recipe thanks to params[:recipe_id]
    recipe = Recipe.find(params[:recipe_id])
    @batch = recipe.batches.find(params[:id])

    if @batch.update(batch_params)
      redirect_to recipe_batches_url, notice: 'Batch was successfully updated.' 
    else
      render :edit

    end
  end


  def destroy
    #first you retrieve the recipe thanks to params[:recipe_id]
    recipe = Recipe.find(params[:recipe_id])
    @batch = recipe.batches.find(params[:id])
    @batch.destroy
    redirect_to recipe_batches_url
  end

  private
    def set_batch
      recipe = Recipe.find(params[:recipe_id])
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.permit(:description, :image, :user_id)
    end
end

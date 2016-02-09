class IngredientsController < ApplicationController
	def create
		@recipe = Recipe.find(params[:recipe_id])
		@ingredient = @recipe.ingredients.create(ingredient_params)
		redirect_to @recipe
	end

	def show
		@recipe = Recipe.find(params[:recipe_id])
		@ingredient = Ingredient.all
	end

	def destroy
		@recipe = Recipe.find(params[:recipe_id])
		@ingredient = @recipe.ingredients.find(params[:id])
		@ingredient.destroy
		redirect_to @recipe
	end


private
    def ingredient_params
      params.require(:ingredient).permit(:name, :ingredient_type, :description, :amount, :use, :boil_time, :aa, :ferment_temp)
    end
end

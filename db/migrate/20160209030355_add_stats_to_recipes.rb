class AddStatsToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :og, :decimal
  	add_column :recipes, :fg, :decimal
  	add_column :recipes, :ibu, :integer
  	add_column :recipes, :srm, :integer
  	add_column :recipes, :abv, :decimal
  	add_column :recipes, :primary_days, :integer
  	add_column :recipes, :secondary_days, :integer
  end
end

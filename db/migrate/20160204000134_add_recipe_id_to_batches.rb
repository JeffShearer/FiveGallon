class AddRecipeIdToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :recipe_id, :integer
    add_index :batches, :recipe_id
  end
end

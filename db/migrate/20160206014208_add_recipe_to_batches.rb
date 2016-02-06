class AddRecipeToBatches < ActiveRecord::Migration
  def change
    add_reference :batches, :recipe, index: true
  end
end

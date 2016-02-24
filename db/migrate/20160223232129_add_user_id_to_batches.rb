class AddUserIdToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :user_id, :integer
    add_index :batches, :user_id
  end
end

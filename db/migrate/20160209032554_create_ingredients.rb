class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :type
      t.text :description
      t.decimal :amount
      t.string :use
      t.integer :boil_time
      t.decimal :aa
      t.decimal :ferment_temp

      t.timestamps
    end
    add_reference :ingredients, :recipe, index: true
  end
end

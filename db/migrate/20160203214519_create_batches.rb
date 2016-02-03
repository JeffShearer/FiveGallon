class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.date :brew_date
      t.time :boil_start_time

      t.timestamps
    end
  end
end

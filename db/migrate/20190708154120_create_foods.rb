class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :ndbnumber
      t.string :name
      t.string :food_group
      t.string :data_source
      t.string :manufacture

      t.timestamps
    end
  end
end

class FixedTypoInFoods < ActiveRecord::Migration[5.2]
  def change
    rename_column :foods, :manufacture, :manufacturer
  end
end

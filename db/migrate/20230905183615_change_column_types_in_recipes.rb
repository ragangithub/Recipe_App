class ChangeColumnTypesInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :preparation_time, :integer, using: 'extract(epoch from preparation_time)::integer'
    change_column :recipes, :cooking_time, :integer, using: 'extract(epoch from cooking_time)::integer'
  end
end

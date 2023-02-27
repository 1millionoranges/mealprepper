class AddAmountsToRecipeList < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients_lists, :amount, :integer
    add_column :ingredients_lists, :unit, :string
  end
end

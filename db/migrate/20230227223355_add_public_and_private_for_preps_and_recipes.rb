class AddPublicAndPrivateForPrepsAndRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :public, :integer
    add_column :preps, :public, :integer
  end
end

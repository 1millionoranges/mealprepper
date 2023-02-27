class CreateIngredientsLists < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients_lists do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.timestamps
    end
  end
end

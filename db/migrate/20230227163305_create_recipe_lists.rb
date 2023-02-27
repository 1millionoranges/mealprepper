class CreateRecipeLists < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_lists do |t|
      t.integer :prep_id
      t.integer :recipe_id
      t.date :planned_meal_date
      t.timestamps
    end
  end
end

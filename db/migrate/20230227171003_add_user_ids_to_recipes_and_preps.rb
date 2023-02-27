class AddUserIdsToRecipesAndPreps < ActiveRecord::Migration[7.0]
  def change
    add_column :preps, :user_id, :integer
    add_column :recipes, :user_id, :integer
  end
end

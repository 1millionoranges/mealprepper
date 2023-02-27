class CreateSavedPreps < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_preps do |t|
      t.integer :user_id
      t.integer :prep_id
      t.timestamps
    end
  end
end

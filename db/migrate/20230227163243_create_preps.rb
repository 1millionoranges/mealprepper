class CreatePreps < ActiveRecord::Migration[7.0]
  def change
    create_table :preps do |t|
      t.string :name
      t.timestamps
    end
  end
end

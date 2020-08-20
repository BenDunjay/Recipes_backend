class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.String :name
      t.string :difficulty
      t.integer :cooking_time

      t.timestamps
    end
  end
end

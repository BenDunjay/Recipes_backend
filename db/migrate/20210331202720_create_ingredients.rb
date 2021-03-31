class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :type_of_ingredient
      t.integer :amount

      t.timestamps
    end
  end
end

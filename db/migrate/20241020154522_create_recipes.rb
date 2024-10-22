class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :quantity
      t.references :ingredient, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end

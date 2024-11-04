class CreateQuantities < ActiveRecord::Migration[7.2]
  def change
    create_table :quantities do |t|
      t.float :quantity
      t.references :ingredient, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end

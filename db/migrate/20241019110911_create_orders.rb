class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :number
      t.string :name
      t.integer :people
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePaperRows < ActiveRecord::Migration[7.2]
  def change
    create_table :paper_rows do |t|
      t.integer :quantity
      t.references :order, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end

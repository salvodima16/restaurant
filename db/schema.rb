# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_04_171834) do
  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.integer "people"
    t.integer "table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "paper_rows", force: :cascade do |t|
    t.integer "quantity"
    t.integer "order_id", null: false
    t.integer "dish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_paper_rows_on_dish_id"
    t.index ["order_id"], name: "index_paper_rows_on_order_id"
  end

  create_table "quantities", force: :cascade do |t|
    t.float "quantity"
    t.integer "ingredient_id", null: false
    t.integer "dish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_quantities_on_dish_id"
    t.index ["ingredient_id"], name: "index_quantities_on_ingredient_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.float "quantity"
    t.integer "ingredient_id", null: false
    t.integer "dish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_recipes_on_dish_id"
    t.index ["ingredient_id"], name: "index_recipes_on_ingredient_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "tables"
  add_foreign_key "paper_rows", "dishes"
  add_foreign_key "paper_rows", "orders"
  add_foreign_key "quantities", "dishes"
  add_foreign_key "quantities", "ingredients"
  add_foreign_key "recipes", "dishes"
  add_foreign_key "recipes", "ingredients"
end

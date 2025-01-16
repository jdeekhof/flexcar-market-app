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

ActiveRecord::Schema[8.0].define(version: 2025_01_16_175755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "brand"
    t.integer "units_of_sale", null: false
    t.bigint "category_id", default: 1, null: false
    t.integer "cents_price_per_unit", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "promotions", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "begins_at", null: false
    t.datetime "ends_at"
    t.integer "minimum_quantity", default: 1, null: false
    t.integer "cents_discount_scalar", null: false
    t.integer "discount_type", null: false
    t.string "promotionable_type", null: false
    t.bigint "promotionable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_promotions_on_code", unique: true
    t.index ["promotionable_type", "promotionable_id"], name: "index_promotions_on_promotionable"
  end
end

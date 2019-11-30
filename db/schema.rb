# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_30_142205) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "appeal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "cash"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "price"
    t.integer "accepted_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accepted_by_id"], name: "index_listings_on_accepted_by_id"
    t.index ["property_id"], name: "index_listings_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "street_id", null: false
    t.integer "company_id"
    t.string "number"
    t.string "type"
    t.integer "floors"
    t.integer "rooms"
    t.datetime "constructed_at"
    t.string "seed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_properties_on_company_id"
    t.index ["street_id"], name: "index_properties_on_street_id"
  end

  create_table "streets", force: :cascade do |t|
    t.integer "city_id", null: false
    t.string "name"
    t.string "appeal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_streets_on_city_id"
  end

  add_foreign_key "listings", "companies", column: "accepted_by_id"
  add_foreign_key "listings", "properties"
  add_foreign_key "properties", "companies"
  add_foreign_key "properties", "streets"
  add_foreign_key "streets", "cities"
end

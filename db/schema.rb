# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_26_173417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cocktailmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cocktail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocktail_id"], name: "index_cocktailmarks_on_cocktail_id"
    t.index ["user_id", "cocktail_id"], name: "index_cocktailmarks_on_user_id_and_cocktail_id", unique: true
    t.index ["user_id"], name: "index_cocktailmarks_on_user_id"
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name", null: false
    t.string "base_alcohol", null: false
    t.string "taste", null: false
    t.string "alcohol_percentage", null: false
    t.string "glass_type", null: false
    t.text "cocktail_recipe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_cocktails_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.string "quantity", null: false
    t.integer "cocktail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cocktailmarks", "cocktails"
  add_foreign_key "cocktailmarks", "users"
end

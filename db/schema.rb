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

ActiveRecord::Schema.define(version: 20180906110302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string "name"
    t.string "damage"
    t.string "rune_path"
    t.string "skill_order"
    t.string "primary_class"
    t.string "secondary_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "create_abilities", force: :cascade do |t|
    t.string "passive"
    t.string "ability_1"
    t.string "ability_2"
    t.string "ability_3"
    t.string "ability_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_champions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "champion_id"
    t.index ["champion_id"], name: "index_favorite_champions_on_champion_id"
    t.index ["user_id"], name: "index_favorite_champions_on_user_id"
  end

  create_table "role_champions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "champion_id"
    t.index ["champion_id"], name: "index_role_champions_on_champion_id"
    t.index ["role_id"], name: "index_role_champions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "passive"
    t.string "q"
    t.string "w"
    t.string "e"
    t.string "r"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "champion_id"
    t.index ["champion_id"], name: "index_skills_on_champion_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "favorite_champions", "champions"
  add_foreign_key "favorite_champions", "users"
  add_foreign_key "role_champions", "champions"
  add_foreign_key "role_champions", "roles"
  add_foreign_key "skills", "champions"
end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160223232129) do

  create_table "batches", force: true do |t|
    t.string   "name"
    t.date     "brew_date"
    t.time     "boil_start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_id"
    t.integer  "user_id"
  end

  add_index "batches", ["recipe_id"], name: "index_batches_on_recipe_id"
  add_index "batches", ["user_id"], name: "index_batches_on_user_id"

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "ingredient_type"
    t.text     "description"
    t.decimal  "amount"
    t.string   "use"
    t.integer  "boil_time"
    t.decimal  "aa"
    t.decimal  "ferment_temp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_id"
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id"

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "style"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "og"
    t.decimal  "fg"
    t.integer  "ibu"
    t.integer  "srm"
    t.decimal  "abv"
    t.integer  "primary_days"
    t.integer  "secondary_days"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

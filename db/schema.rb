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

ActiveRecord::Schema.define(version: 20150823080757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dayoffs", force: :cascade do |t|
    t.text     "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "localizations", force: :cascade do |t|
    t.string   "state"
    t.string   "division"
    t.string   "campus"
    t.string   "building"
    t.integer  "floor"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "capacity"
    t.decimal  "cost"
    t.text     "goods"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "status"
    t.integer  "category_id"
    t.integer  "role_id"
    t.integer  "dayoff_id"
    t.integer  "localization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "places", ["category_id"], name: "index_places_on_category_id", using: :btree
  add_index "places", ["dayoff_id"], name: "index_places_on_dayoff_id", using: :btree
  add_index "places", ["localization_id"], name: "index_places_on_localization_id", using: :btree
  add_index "places", ["role_id"], name: "index_places_on_role_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.text     "guest"
    t.integer  "status"
    t.string   "userapproved"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stuffs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cuantity"
    t.float    "cost"
    t.integer  "status"
    t.integer  "role_id"
    t.integer  "dayoff_id"
    t.integer  "localization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "stuffs", ["dayoff_id"], name: "index_stuffs_on_dayoff_id", using: :btree
  add_index "stuffs", ["localization_id"], name: "index_stuffs_on_localization_id", using: :btree
  add_index "stuffs", ["role_id"], name: "index_stuffs_on_role_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "places", "categories"
  add_foreign_key "places", "dayoffs"
  add_foreign_key "places", "localizations"
  add_foreign_key "places", "roles"
  add_foreign_key "reservations", "users"
  add_foreign_key "stuffs", "dayoffs"
  add_foreign_key "stuffs", "localizations"
  add_foreign_key "stuffs", "roles"
end

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

ActiveRecord::Schema.define(version: 20151204185924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "microsites", force: :cascade do |t|
    t.string "site"
    t.float  "field_lat"
    t.float  "field_lon"
    t.string "location"
    t.string "state_province"
    t.string "country"
    t.string "biomimic"
    t.string "zone"
    t.string "sub_zone"
    t.string "wave_exp"
    t.float  "tide_height"
    t.string "microsite_id"
  end

  create_table "readings", force: :cascade do |t|
    t.integer  "microsite_id"
    t.datetime "timestamp"
    t.float    "temperature"
  end

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

  add_foreign_key "readings", "microsites"
end

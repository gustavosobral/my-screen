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

ActiveRecord::Schema.define(version: 20161012035435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_keys", force: :cascade do |t|
    t.string   "access_token"
    t.boolean  "expired",      default: false
    t.integer  "terminal_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "access_keys", ["terminal_id"], name: "index_access_keys_on_terminal_id", using: :btree

  create_table "playlist_items", force: :cascade do |t|
    t.integer  "position"
    t.float    "duration"
    t.integer  "playlist_id"
    t.integer  "resource_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "playlist_items", ["playlist_id"], name: "index_playlist_items_on_playlist_id", using: :btree
  add_index "playlist_items", ["resource_id"], name: "index_playlist_items_on_resource_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.float    "duration"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "terminals_count"
    t.integer  "playlist_items_count"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "resources", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "file"
    t.integer  "user_id"
    t.float    "duration"
  end

  add_index "resources", ["user_id"], name: "index_resources_on_user_id", using: :btree

  create_table "terminals", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "playlist_id"
    t.string   "password_digest"
    t.boolean  "notified",        default: true
  end

  add_index "terminals", ["playlist_id"], name: "index_terminals_on_playlist_id", using: :btree
  add_index "terminals", ["user_id"], name: "index_terminals_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "access_keys", "terminals"
  add_foreign_key "playlist_items", "playlists"
  add_foreign_key "playlist_items", "resources"
  add_foreign_key "playlists", "users"
  add_foreign_key "resources", "users"
  add_foreign_key "terminals", "playlists"
  add_foreign_key "terminals", "users"
end

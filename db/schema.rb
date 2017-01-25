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

ActiveRecord::Schema.define(version: 20170125203120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admins", force: :cascade do |t|
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
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "starts_at"
    t.integer  "duration"
    t.integer  "location_id"
    t.string   "activity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_availabilities_on_location_id", using: :btree
    t.index ["user_id"], name: "index_availabilities_on_user_id", using: :btree
  end

  create_table "event_registrations", force: :cascade do |t|
    t.string   "how_heard"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "profile_id"
    t.index ["event_id"], name: "index_event_registrations_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.decimal  "price"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "starts_at"
    t.text     "description"
    t.string   "image_file_name", default: ""
    t.integer  "capacity",        default: 1
    t.integer  "profile_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.integer "duration_in_min"
    t.text    "workout"
    t.date    "workout_date"
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_exercises_on_profile_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user1_id", "user2_id"], name: "index_friendships_on_user1_id_and_user2_id", unique: true, using: :btree
    t.index ["user2_id", "user1_id"], name: "index_friendships_on_user2_id_and_user1_id", unique: true, using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_likes_on_event_id", using: :btree
    t.index ["profile_id"], name: "index_likes_on_profile_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "location_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "location_id"
    t.string   "custom_location"
    t.date     "born_on"
    t.string   "zip_code"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["location_id"], name: "index_profiles_on_location_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "availabilities", "locations"
  add_foreign_key "availabilities", "users"
  add_foreign_key "event_registrations", "events"
  add_foreign_key "exercises", "profiles"
  add_foreign_key "likes", "events"
  add_foreign_key "likes", "profiles"
  add_foreign_key "profiles", "locations"
  add_foreign_key "profiles", "users"
end

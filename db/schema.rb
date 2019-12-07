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

ActiveRecord::Schema.define(version: 2019_12_02_033636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.string "name"
    t.boolean "private_event", default: true
    t.string "join_code"
  end

  create_table "gifts", force: :cascade do |t|
    t.bigint "user_event_id"
    t.integer "giftee_event_id"
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.string "url"
    t.integer "priority", default: 0
    t.string "color"
    t.string "size"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_event_id"], name: "index_gifts_on_user_event_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_events", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "permission_id"
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["permission_id"], name: "index_user_events_on_permission_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "google_token"
    t.string "google_refresh_token"
    t.integer "last_event_id"
  end

end

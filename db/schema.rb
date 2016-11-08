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

ActiveRecord::Schema.define(version: 20161104213025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.string   "city"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "joins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "joins", ["event_id"], name: "index_joins_on_event_id", using: :btree
  add_index "joins", ["user_id"], name: "index_joins_on_user_id", using: :btree

  create_table "letters", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "date"
    t.string   "Q1"
    t.string   "Q2"
    t.string   "Q3"
    t.string   "Q4"
    t.string   "Q5"
    t.string   "Q6"
    t.string   "Q7"
    t.string   "Q8"
    t.string   "Q9"
    t.string   "Q10"
    t.string   "Q11"
    t.string   "Q12"
    t.string   "Q13"
    t.string   "Q14"
    t.string   "Q15"
    t.string   "Q16"
    t.string   "Q17"
    t.string   "Q18"
    t.string   "Q19"
    t.string   "Q20"
    t.string   "Q21"
  end

  add_index "letters", ["event_id"], name: "index_letters_on_event_id", using: :btree
  add_index "letters", ["user_id"], name: "index_letters_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "password_digest"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "username"
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "joins", "events"
  add_foreign_key "joins", "users"
  add_foreign_key "letters", "events"
  add_foreign_key "letters", "users"
end

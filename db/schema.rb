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

ActiveRecord::Schema.define(version: 20161107051916) do

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
    t.string   "Q22"
    t.string   "Q23"
    t.string   "Q24"
    t.string   "Q25"
    t.string   "Q26"
    t.string   "Q27"
    t.string   "Q28"
    t.string   "Q29"
    t.string   "Q30"
    t.string   "Q31"
    t.string   "Q32"
    t.string   "Q33"
    t.string   "Q34"
    t.string   "Q35"
    t.string   "Q36"
    t.string   "Q37"
    t.string   "Q38"
    t.string   "Q39"
    t.string   "Q40"
    t.string   "Q41"
    t.string   "Q42"
    t.string   "Q43"
    t.string   "Q44"
    t.string   "Q45"
    t.string   "Q46"
    t.string   "Q47"
    t.string   "Q48"
    t.string   "Q49"
    t.string   "Q50"
    t.string   "Q51"
    t.string   "Q52"
    t.string   "Q53"
    t.string   "Q54"
    t.string   "Q55"
    t.string   "Q56"
    t.string   "Q57"
    t.string   "Q58"
    t.string   "Q59"
    t.string   "Q60"
    t.string   "Q61"
    t.string   "Q62"
    t.string   "Q63"
    t.string   "Q64"
    t.string   "Q65"
    t.string   "Q66"
    t.string   "Q67"
    t.string   "Q68"
    t.string   "Q69"
    t.string   "Q70"
    t.string   "Q71"
    t.string   "Q72"
    t.string   "Q73"
    t.string   "Q74"
    t.string   "Q75"
    t.string   "Q76"
    t.string   "Q77"
    t.string   "Q78"
    t.string   "Q79"
    t.string   "Q80"
    t.string   "Q81"
    t.string   "Q82"
    t.string   "Q83"
    t.string   "Q84"
    t.string   "Q85"
    t.string   "Q86"
    t.string   "Q87"
    t.string   "Q88"
    t.string   "Q89"
    t.string   "Q90"
    t.string   "Q91"
    t.string   "Q92"
    t.string   "Q93"
    t.string   "Q94"
    t.string   "Q95"
    t.string   "Q96"
    t.string   "Q97"
    t.string   "Q98"
    t.string   "Q99"
    t.string   "Q100"
    t.string   "Q101"
    t.string   "Q102"
    t.string   "Q103"
    t.string   "Q104"
    t.string   "Q105"
    t.string   "Q106"
    t.string   "Q107"
    t.string   "Q108"
    t.string   "Q109"
    t.string   "Q110"
    t.string   "Q111"
    t.string   "Q112"
    t.string   "Q113"
    t.string   "Q114"
    t.string   "Q115"
    t.string   "Q116"
    t.string   "Q117"
    t.string   "Q118"
    t.string   "Q119"
    t.string   "Q120"
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

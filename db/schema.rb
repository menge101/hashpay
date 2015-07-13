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

ActiveRecord::Schema.define(version: 20150715005832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "kennel"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendees", ["event_id"], name: "index_attendees_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "hash_kennel_id"
    t.string   "name"
    t.decimal  "cost"
    t.datetime "date"
    t.string   "description"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["date"], name: "index_events_on_date", using: :btree
  add_index "events", ["hash_kennel_id"], name: "index_events_on_hash_kennel_id", using: :btree

  create_table "hash_kennels", force: true do |t|
    t.string   "full_name"
    t.string   "abbreviation"
    t.string   "description"
    t.string   "region"
    t.datetime "founding"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

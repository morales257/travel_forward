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

ActiveRecord::Schema.define(version: 20161011011452) do

  create_table "credits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "credit_balance"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "credits", ["user_id"], name: "index_credits_on_user_id"

  create_table "downloads", force: :cascade do |t|
    t.integer  "downloader_id"
    t.integer  "downloaded_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "downloads", ["downloaded_id"], name: "index_downloads_on_downloaded_id"
  add_index "downloads", ["downloader_id", "downloaded_id"], name: "index_downloads_on_downloader_id_and_downloaded_id", unique: true
  add_index "downloads", ["downloader_id"], name: "index_downloads_on_downloader_id"

  create_table "itineraries", force: :cascade do |t|
    t.string   "country"
    t.string   "locations"
    t.string   "trip_duration"
    t.integer  "budget"
    t.text     "tip"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "credit_cost"
    t.integer  "trip_in_days"
  end

  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id"

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.integer  "author_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "itinerary_id"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

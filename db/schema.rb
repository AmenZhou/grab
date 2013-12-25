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

ActiveRecord::Schema.define(version: 20131225193530) do

  create_table "post_dd_busitrans", force: true do |t|
    t.string   "title"
    t.string   "ct_name"
    t.string   "unique_code"
    t.string   "detail_url"
    t.datetime "upload_time"
    t.text     "content"
    t.string   "phone_n"
    t.string   "rent_m"
    t.string   "site_source"
    t.datetime "up_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_dd_housales", force: true do |t|
    t.string   "title"
    t.string   "ct_name"
    t.string   "unique_code"
    t.string   "detail_url"
    t.datetime "upload_time"
    t.text     "content"
    t.string   "phone_n"
    t.string   "rent_m"
    t.string   "site_source"
    t.datetime "up_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_recruits", force: true do |t|
    t.string   "title"
    t.string   "ct_name"
    t.string   "unique_code"
    t.string   "detail_url"
    t.datetime "upload_time"
    t.text     "content"
    t.string   "phone_n"
    t.string   "rent_m"
    t.string   "site_source"
    t.datetime "up_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "ct_name"
    t.string   "unique_code"
    t.string   "detail_url"
    t.datetime "upload_time"
    t.text     "content"
    t.string   "phone_n"
    t.string   "rent_m"
    t.string   "site_source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "up_time"
  end

end

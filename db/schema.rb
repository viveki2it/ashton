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

ActiveRecord::Schema.define(version: 20140324164227) do

  create_table "lettings", force: true do |t|
    t.string   "letting_uid"
    t.boolean  "letting_proposal",           default: true
    t.string   "title"
    t.float    "price"
    t.text     "property_short_description"
    t.text     "proposal_description"
    t.integer  "bedroom_count"
    t.date     "available_from"
    t.string   "property_category"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "town"
    t.string   "area"
    t.string   "country"
    t.string   "post_code"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "price_type"
    t.float    "deposit_amount"
    t.boolean  "featured",                   default: false
    t.string   "publish_as"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

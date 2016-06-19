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

ActiveRecord::Schema.define(version: 20160605081452) do

  create_table "categories", force: :cascade do |t|
    t.string   "browsenode_id"
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "asin"
    t.string   "ean"
    t.text     "model"
    t.text     "title"
    t.text     "partnumber"
    t.text     "durl"
    t.text     "small_image"
    t.text     "midium_image"
    t.text     "large_image"
    t.text     "brand"
    t.text     "color"
    t.text     "manufacture"
    t.text     "sales_rank"
    t.text     "feature"
    t.text     "editorialreviews"
    t.string   "height"
    t.string   "width"
    t.string   "length"
    t.string   "pkg_height_inc"
    t.string   "pkg_width_inc"
    t.string   "pkg_length_inc"
    t.string   "list_price"
    t.text     "price"
    t.string   "amount_savd"
    t.string   "availabilityattributes"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "category_name"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"

end

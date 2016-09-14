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

ActiveRecord::Schema.define(version: 20160914014022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_suburbs", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "suburb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_tags", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.text     "image_url"
    t.text     "address_street"
    t.text     "address_suburb"
    t.string   "provider"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "suburbs", force: :cascade do |t|
    t.string   "suburb"
    t.integer  "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

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

ActiveRecord::Schema.define(version: 20140709155157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: true do |t|
    t.string   "breed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breeds_pets", id: false, force: true do |t|
    t.integer "breed_id", null: false
    t.integer "pet_id",   null: false
  end

  create_table "locations", force: true do |t|
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations_pets", id: false, force: true do |t|
    t.integer "location_id", null: false
    t.integer "pet_id",      null: false
  end

  create_table "options", force: true do |t|
    t.string   "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options_pets", id: false, force: true do |t|
    t.integer "option_id", null: false
    t.integer "pet_id",    null: false
  end

  create_table "pets", force: true do |t|
    t.integer  "pf_id"
    t.string   "shelter_id"
    t.string   "animal_type"
    t.string   "name"
    t.string   "age"
    t.string   "sex"
    t.string   "size"
    t.text     "description"
    t.string   "last_update"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "url"
    t.integer  "pet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["pet_id"], name: "index_photos_on_pet_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

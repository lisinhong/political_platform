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

ActiveRecord::Schema.define(version: 20181031101301) do

  create_table "hashtags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "politic_type_id"
  end

  create_table "hashtags_politics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hashtag_id"
    t.integer "politic_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "party"
    t.integer "age"
    t.integer "gender"
    t.string "city"
    t.datetime "birth"
    t.string "school"
    t.string "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "politics", force: :cascade do |t|
    t.string "description"
    t.integer "politician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_type"
  end

end

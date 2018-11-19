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

ActiveRecord::Schema.define(version: 20181117061309) do

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

  create_table "questions", force: :cascade do |t|
    t.integer "p_type"
    t.string "q_type"
    t.string "o_comment"
    t.string "m_comment"
    t.string "option_a"
    t.string "option_b"
    t.string "option_c"
    t.string "option_d"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "option_a_key"
    t.integer "option_b_key"
    t.integer "option_c_key"
    t.integer "option_d_key"
  end

<<<<<<< HEAD
  create_table "results", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "affairs"
    t.integer "transportation"
    t.integer "economic"
    t.integer "education"
    t.integer "teen"
    t.integer "citizen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "u_id"
  end

  create_table "simple_hashtag_hashtags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_simple_hashtag_hashtags_on_name"
  end

=======
>>>>>>> complete layout
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "facebook"
    t.string "remote_avatar_url"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

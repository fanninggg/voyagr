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

ActiveRecord::Schema.define(version: 20180307140423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "budget"
    t.string "location"
    t.string "type_of_evening"
    t.string "type_of_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "price_answer_id"
    t.bigint "location_answer_id"
    t.bigint "evening_answer_id"
    t.bigint "city_type_answer_id"
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.index ["city_type_answer_id"], name: "index_cities_on_city_type_answer_id"
    t.index ["evening_answer_id"], name: "index_cities_on_evening_answer_id"
    t.index ["location_answer_id"], name: "index_cities_on_location_answer_id"
    t.index ["price_answer_id"], name: "index_cities_on_price_answer_id"
  end

  create_table "city_type_answers", force: :cascade do |t|
    t.string "content"
    t.bigint "city_type_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_type_question_id"], name: "index_city_type_answers_on_city_type_question_id"
  end

  create_table "city_type_questions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evening_answers", force: :cascade do |t|
    t.string "content"
    t.bigint "evening_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evening_question_id"], name: "index_evening_answers_on_evening_question_id"
  end

  create_table "evening_questions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_answers", force: :cascade do |t|
    t.string "content"
    t.bigint "location_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_question_id"], name: "index_location_answers_on_location_question_id"
  end

  create_table "location_questions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_answers", force: :cascade do |t|
    t.string "content"
    t.bigint "price_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_question_id"], name: "index_price_answers_on_price_question_id"
  end

  create_table "price_questions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_answers", force: :cascade do |t|
    t.bigint "price_answer_id"
    t.bigint "location_answer_id"
    t.bigint "evening_answer_id"
    t.bigint "city_type_answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_type_answer_id"], name: "index_trip_answers_on_city_type_answer_id"
    t.index ["evening_answer_id"], name: "index_trip_answers_on_evening_answer_id"
    t.index ["location_answer_id"], name: "index_trip_answers_on_location_answer_id"
    t.index ["price_answer_id"], name: "index_trip_answers_on_price_answer_id"
  end

  create_table "trip_cities", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "trip_answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_trip_cities_on_city_id"
    t.index ["trip_answer_id"], name: "index_trip_cities_on_trip_answer_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "city_type_answers"
  add_foreign_key "cities", "evening_answers"
  add_foreign_key "cities", "location_answers"
  add_foreign_key "cities", "price_answers"
  add_foreign_key "city_type_answers", "city_type_questions"
  add_foreign_key "evening_answers", "evening_questions"
  add_foreign_key "location_answers", "location_questions"
  add_foreign_key "price_answers", "price_questions"
  add_foreign_key "trip_answers", "city_type_answers"
  add_foreign_key "trip_answers", "evening_answers"
  add_foreign_key "trip_answers", "location_answers"
  add_foreign_key "trip_answers", "price_answers"
  add_foreign_key "trip_cities", "cities"
  add_foreign_key "trip_cities", "trip_answers"
  add_foreign_key "trips", "users"
end

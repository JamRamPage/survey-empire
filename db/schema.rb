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

ActiveRecord::Schema.define(version: 2020_05_24_194835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.integer "status"
    t.string "token"
    t.string "charge_id"
    t.string "error_message"
    t.string "customer_id"
    t.integer "payment_gateway"
    t.integer "price_cents", default: 0, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "stripe_plan_name"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
  end

  create_table "question_answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.string "givenAnswer", comment: "can be null as answer may be a selection instead of text entry"
    t.datetime "timeStarted", comment: "null before question started???"
    t.datetime "timeEnded", comment: "null before answer submitted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "survey_id"
    t.index ["question_id"], name: "index_question_answers_on_question_id"
    t.index ["survey_id"], name: "index_question_answers_on_survey_id"
    t.index ["user_id"], name: "index_question_answers_on_user_id"
  end

  create_table "question_option_selections", force: :cascade do |t|
    t.bigint "question_answer_id", null: false
    t.bigint "question_option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_answer_id"], name: "index_question_option_selections_on_question_answer_id"
    t.index ["question_option_id"], name: "index_question_option_selections_on_question_option_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "optionString", null: false
    t.boolean "correct", comment: "can be null, if the survey is subjective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.string "questionString", null: false
    t.boolean "multipleChoice", default: false, null: false
    t.boolean "multipleAnswer", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "user_id"
    t.integer "rating_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.boolean "public", default: false, null: false
    t.datetime "creationDate", null: false
    t.datetime "expiryDate", null: false
    t.integer "likes", default: 0, null: false
    t.integer "dislikes", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "survey_name", default: "", null: false
    t.boolean "deployed", default: false
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "consent"
    t.string "stripe_customer_id"
    t.boolean "premium", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "question_answers", "questions"
  add_foreign_key "question_answers", "surveys"
  add_foreign_key "question_answers", "users"
  add_foreign_key "question_option_selections", "question_answers"
  add_foreign_key "question_option_selections", "question_options"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "surveys"
  add_foreign_key "surveys", "users"
end

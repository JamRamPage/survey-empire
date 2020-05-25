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

ActiveRecord::Schema.define(version: 2020_05_25_211638) do

  create_table "question_answers", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.integer "survey_id"
    t.string "givenAnswer_ciphertext"
    t.text "timeStarted_ciphertext"
    t.text "timeEnded_ciphertext"
    t.text "created_at_ciphertext"
    t.text "updated_at_ciphertext"
    t.index ["question_id"], name: "index_question_answers_on_question_id"
    t.index ["survey_id"], name: "index_question_answers_on_survey_id"
    t.index ["user_id"], name: "index_question_answers_on_user_id"
  end

  create_table "question_option_selections", force: :cascade do |t|
    t.integer "question_answer_id", null: false
    t.integer "question_option_id", null: false
    t.text "created_at_ciphertext"
    t.text "updated_at_ciphertext"
    t.index ["question_answer_id"], name: "index_question_option_selections_on_question_answer_id"
    t.index ["question_option_id"], name: "index_question_option_selections_on_question_option_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.integer "question_id", null: false
    t.text "optionString_ciphertext"
    t.text "correct_ciphertext"
    t.text "created_at_ciphertext"
    t.text "updated_at_ciphertext"
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.text "questionString_ciphertext"
    t.text "multipleChoice_ciphertext"
    t.text "multipleAnswer_ciphertext"
    t.text "created_at_ciphertext"
    t.text "updated_at_ciphertext"
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
    t.integer "likes", default: 0, null: false
    t.integer "dislikes", default: 0, null: false
    t.integer "user_id"
    t.text "public_ciphertext"
    t.text "creationDate_ciphertext"
    t.text "expiryDate_ciphertext"
    t.text "created_at_ciphertext"
    t.text "updated_at_ciphertext"
    t.text "survey_name_ciphertext"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.text "email_ciphertext"
    t.text "reset_password_token_ciphertext"
    t.text "reset_password_sent_at_ciphertext"
    t.text "remember_created_at_ciphertext"
    t.text "created_at_ciphertext"
    t.text "updated_at_ciphertext"
    t.text "consent_ciphertext"
  end

end

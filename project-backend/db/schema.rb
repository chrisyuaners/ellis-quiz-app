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

ActiveRecord::Schema.define(version: 2019_07_11_134328) do

  create_table "answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "card_id"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_answers_on_card_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "card_choices", force: :cascade do |t|
    t.integer "card_id"
    t.integer "choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_choices_on_card_id"
    t.index ["choice_id"], name: "index_card_choices_on_choice_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.text "description"
    t.string "image_url"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choices", force: :cascade do |t|
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session_cards", force: :cascade do |t|
    t.integer "session_id"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_session_cards_on_card_id"
    t.index ["session_id"], name: "index_session_cards_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "right"
    t.integer "wrong"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

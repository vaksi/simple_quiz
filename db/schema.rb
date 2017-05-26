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

ActiveRecord::Schema.define(version: 20170526043925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answares", force: :cascade do |t|
    t.string   "description"
    t.integer  "quiz_id"
    t.boolean  "status"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["quiz_id"], name: "index_answares_on_quiz_id", using: :btree
    t.index ["user_id"], name: "index_answares_on_user_id", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status",      default: false
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_courses_on_user_id", using: :btree
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "quiz_id"
    t.boolean  "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_follows_on_quiz_id", using: :btree
    t.index ["user_id"], name: "index_follows_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "description"
    t.string   "answare"
    t.integer  "quiz_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "answer_digest"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "title"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_quizzes_on_course_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "password_digest"
    t.string   "role",            default: "student"
    t.string   "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "answares", "quizzes"
  add_foreign_key "answares", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "follows", "quizzes"
  add_foreign_key "follows", "users"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "courses"
end

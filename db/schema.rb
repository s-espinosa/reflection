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

ActiveRecord::Schema.define(version: 20170815022816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_assignments_on_project_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prompts", force: :cascade do |t|
    t.string "prompt"
  end

  create_table "reflection_questions", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "prompt_id"
    t.index ["project_id"], name: "index_reflection_questions_on_project_id"
    t.index ["prompt_id"], name: "index_reflection_questions_on_prompt_id"
  end

  create_table "reflection_responses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "prompt_id"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_reflection_responses_on_project_id"
    t.index ["prompt_id"], name: "index_reflection_responses_on_prompt_id"
    t.index ["user_id"], name: "index_reflection_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "nickname"
    t.string "name"
    t.string "email"
    t.string "image_url"
    t.string "token"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cohort_id"
    t.integer "instructor_cohort_id"
    t.index ["cohort_id"], name: "index_users_on_cohort_id"
    t.index ["instructor_cohort_id"], name: "index_users_on_instructor_cohort_id"
  end

  add_foreign_key "assignments", "projects"
  add_foreign_key "assignments", "users"
  add_foreign_key "reflection_questions", "projects"
  add_foreign_key "reflection_questions", "prompts"
  add_foreign_key "reflection_responses", "projects"
  add_foreign_key "reflection_responses", "prompts"
  add_foreign_key "reflection_responses", "users"
end

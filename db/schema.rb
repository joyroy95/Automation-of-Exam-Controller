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

ActiveRecord::Schema.define(version: 20180711073352) do

  create_table "admin_users", force: :cascade do |t|
    t.string "name"
    t.string "username", limit: 20, null: false
    t.string "password_digest", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "atten"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "batches_id"
    t.integer "terms_id"
    t.integer "users_id"
    t.index ["batches_id"], name: "index_attendances_on_batches_id"
    t.index ["terms_id"], name: "index_attendances_on_terms_id"
    t.index ["users_id"], name: "index_attendances_on_users_id"
  end

  create_table "batches", force: :cascade do |t|
    t.string "name", limit: 150
    t.integer "degree_id", null: false
    t.integer "term_type_id", null: false
    t.integer "department_id", null: false
    t.integer "session", null: false
    t.integer "total_credit", null: false
    t.integer "total_length_in_year", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id", "degree_id", "session"], name: "unique_batch", unique: true
    t.index ["term_type_id"], name: "index_batches_on_term_type_id"
  end

  create_table "course_adds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "registrations_id"
    t.integer "courses_id"
    t.index ["courses_id"], name: "index_course_adds_on_courses_id"
    t.index ["registrations_id"], name: "index_course_adds_on_registrations_id"
  end

  create_table "course_types", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.index [nil], name: "unique_course_type_name", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "code", limit: 60, null: false
    t.string "name", limit: 60, null: false
    t.integer "course_type_id", null: false
    t.integer "batch_id", null: false
    t.integer "term", limit: 1, null: false
    t.boolean "is_major", null: false
    t.boolean "is_optional", default: false, null: false
    t.integer "credit", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_courses_on_batch_id"
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
  end

  create_table "dummies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "gender", limit: 12, null: false
    t.index [nil], name: "unique_gender_lower", unique: true
  end

  create_table "halls", force: :cascade do |t|
    t.string "name", limit: 60, null: false
    t.index [nil], name: "unique_hall_name", unique: true
  end

  create_table "personal_infos", force: :cascade do |t|
    t.string "fathers_name", limit: 60, null: false
    t.string "mothers_name", limit: 60, null: false
    t.string "date_of_birth", null: false
    t.string "phone_number", null: false
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "halls_id"
    t.integer "genders_id"
    t.integer "users_id"
    t.integer "batches_id"
    t.index ["batches_id"], name: "index_personal_infos_on_batches_id"
    t.index ["genders_id"], name: "index_personal_infos_on_genders_id"
    t.index ["halls_id"], name: "index_personal_infos_on_halls_id"
    t.index ["users_id"], name: "index_personal_infos_on_users_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "exam_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "degrees_id"
    t.integer "terms_id"
    t.integer "users_id"
    t.integer "exam_statuses_id"
    t.integer "batches_id"
    t.index ["batches_id"], name: "index_registrations_on_batches_id"
    t.index ["degrees_id"], name: "index_registrations_on_degrees_id"
    t.index ["exam_statuses_id"], name: "index_registrations_on_exam_statuses_id"
    t.index ["terms_id"], name: "index_registrations_on_terms_id"
    t.index ["users_id"], name: "index_registrations_on_users_id"
  end

  create_table "submitted_exam_regis_forms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submitteds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "term_types", force: :cascade do |t|
    t.string "name", limit: 12, null: false
    t.integer "exam_per_year", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: false, force: :cascade do |t|
    t.integer "id"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "departments_id"
    t.string "password_digest"
    t.index ["departments_id"], name: "index_users_on_departments_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id", unique: true
  end

end

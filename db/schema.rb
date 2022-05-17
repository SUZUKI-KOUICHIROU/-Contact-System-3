# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_17_025211) do
  create_table "classnumbers", force: :cascade do |t|
    t.string "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schoolclasses", force: :cascade do |t|
    t.date "contact_date"
    t.string "note"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "school_year"
    t.string "name"
    t.string "class_name"
    t.string "teacher_note"
    t.string "title"
    t.string "school_contact"
    t.string "title_2"
    t.string "teacher_note_2"
    t.string "school_contact_2"
    t.string "guardian_note_1"
    t.string "guardian_note_2"
    t.string "guardian_note_3"
    t.string "guardian_note_4"
    t.string "title_3"
    t.string "title_4"
    t.string "contact_board"
    t.string "board_title"
    t.string "board_class"
    t.string "student_name"
    t.date "birthday"
    t.string "class_belongs"
    t.integer "student_number"
    t.string "guardian_name"
    t.index ["user_id"], name: "index_schoolclasses_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "student_name"
    t.date "birthday"
    t.string "class_belongs"
    t.integer "student_number"
    t.string "guardian_name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.boolean "teacher", default: false
    t.string "teacher_name"
    t.string "class_number"
    t.date "birthday"
    t.integer "age"
    t.string "address"
    t.string "telephone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "schoolclasses", "users"
  add_foreign_key "students", "users"
end

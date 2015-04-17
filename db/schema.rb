# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150417022906) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "courses", force: :cascade do |t|
    t.integer  "crn"
    t.string   "course_name"
    t.text     "title"
    t.string   "instructor"
    t.string   "days"
    t.integer  "starts"
    t.integer  "ends"
    t.string   "building_room"
    t.decimal  "credits",       precision: 10, scale: 2
    t.string   "coreq"
    t.string   "crosslist"
    t.text     "restrictions"
    t.string   "prereq"
    t.text     "notes"
<<<<<<< HEAD
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "student_id"
=======
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "courses_requirements", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "requirement_id"
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
>>>>>>> 8ed866995275f69e7e6e54e1f84a6da7e0caf915
  end

  create_table "requirements", force: :cascade do |t|
    t.string   "name"
    t.integer  "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements_students", id: false, force: :cascade do |t|
    t.integer "requirement_id"
    t.integer "student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string  "first"
    t.string  "last"
    t.string  "sid"
    t.integer "year"
    t.string  "major"
    t.integer "courses_taken"
    t.integer "courses_progress"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

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

ActiveRecord::Schema.define(version: 20150403000659) do

  create_table "courses", force: :cascade do |t|
    t.integer  "crn"
    t.string   "course_name"
    t.text     "title"
    t.string   "instructor"
    t.string   "days"
    t.integer  "starts"
    t.integer  "ends"
    t.string   "building_room"
    t.decimal  "credits",       precision: 2, scale: 2
    t.string   "coreq"
    t.string   "crosslist"
    t.text     "restrictions"
    t.string   "prereq"
    t.text     "notes"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.string   "name"
    t.integer  "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string  "first"
    t.string  "last"
    t.string  "sid"
    t.integer "courses_taken"
    t.integer "courses_progress"
  end

end

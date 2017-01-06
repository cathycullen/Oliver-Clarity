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

ActiveRecord::Schema.define(version: 20170106200925) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "attorneys", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "license"
    t.string   "states"
    t.string   "practice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "rate"
  end

  create_table "budgets", force: :cascade do |t|
    t.integer  "annual_amount"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "corps", force: :cascade do |t|
    t.string   "contact"
    t.string   "email"
    t.string   "entity"
    t.string   "owners"
    t.string   "office"
    t.string   "state"
    t.string   "company"
    t.string   "business"
    t.string   "regagent"
    t.string   "regoffice"
    t.string   "incorporation"
    t.string   "ein"
    t.string   "next"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "date"
    t.string   "vendor"
    t.string   "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fees", force: :cascade do |t|
    t.string   "date"
    t.string   "rate"
    t.string   "hours"
    t.string   "charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marks", force: :cascade do |t|
    t.string   "contact"
    t.string   "email"
    t.string   "owner"
    t.string   "entity"
    t.string   "address"
    t.string   "description"
    t.string   "colors"
    t.string   "anywhere"
    t.string   "commerce"
    t.string   "products"
    t.string   "aural"
    t.string   "serial"
    t.string   "registration"
    t.string   "next"
    t.string   "deadline"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "minutes", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.datetime "date"
    t.string   "kind"
    t.string   "attendees"
    t.string   "notice"
    t.string   "vote"
    t.string   "resolutions"
    t.string   "additional"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string   "item"
    t.string   "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_attorneys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "attorney_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["attorney_id"], name: "index_users_attorneys_on_attorney_id"
    t.index ["user_id"], name: "index_users_attorneys_on_user_id"
  end

  create_table "webdocs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "owner"
    t.string   "url"
    t.string   "state"
    t.string   "children"
    t.string   "products"
    t.string   "similar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

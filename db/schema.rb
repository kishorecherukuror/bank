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

ActiveRecord::Schema.define(version: 20160919131055) do

  create_table "accounts", force: :cascade do |t|
    t.string   "account_number"
    t.string   "account_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "branch_id"
    t.integer  "amount"
  end

  create_table "branches", force: :cascade do |t|
    t.string   "area"
    t.string   "ifsc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.integer  "amount"
    t.string   "dep_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "transaction_type"
    t.integer  "amount"
    t.date     "trasaction_date"
    t.integer  "account_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id"

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "ful_name"
    t.string   "email"
    t.integer  "age"
    t.text     "address"
    t.string   "gender"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "withdraws", force: :cascade do |t|
    t.integer  "amount"
    t.string   "withdraw_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end

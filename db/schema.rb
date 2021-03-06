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

ActiveRecord::Schema.define(version: 20171009090401) do

  create_table "audit_logs", force: :cascade do |t|
    t.integer "prize_id"
    t.integer "subscriber_id"
    t.integer "condition_id"
    t.boolean "delivered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_audit_logs_on_condition_id"
    t.index ["prize_id"], name: "index_audit_logs_on_prize_id"
    t.index ["subscriber_id"], name: "index_audit_logs_on_subscriber_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.integer "number"
    t.integer "after_num"
    t.string "condition_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subscriber_id"
    t.integer "prize_id"
    t.index ["prize_id"], name: "index_conditions_on_prize_id"
    t.index ["subscriber_id"], name: "index_conditions_on_subscriber_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "existences"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

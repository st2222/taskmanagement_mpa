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

ActiveRecord::Schema.define(version: 2020_04_12_114423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", primary_key: ["from_friend_id", "to_friend_id"], force: :cascade do |t|
    t.bigint "from_friend_id", null: false
    t.bigint "to_friend_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_friend_id"], name: "index_friends_on_from_friend_id"
    t.index ["to_friend_id"], name: "index_friends_on_to_friend_id"
  end

  create_table "task_branches", primary_key: ["task_id", "branch_id"], force: :cascade do |t|
    t.bigint "task_id", null: false
    t.integer "branch_id", null: false
    t.string "content", limit: 30, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_branches_on_task_id"
  end

  create_table "task_shares", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "user1_id", null: false
    t.bigint "user2_id", null: false
    t.integer "group_id"
    t.string "value1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_shares_on_task_id"
    t.index ["user1_id"], name: "index_task_shares_on_user1_id"
    t.index ["user2_id"], name: "index_task_shares_on_user2_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", limit: 30, null: false
    t.text "content", null: false
    t.integer "importance", null: false
    t.integer "urgency", null: false
    t.string "image_id"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.string "value1"
    t.string "value2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friends", "users", column: "from_friend_id"
  add_foreign_key "friends", "users", column: "to_friend_id"
  add_foreign_key "task_branches", "tasks"
  add_foreign_key "task_shares", "tasks"
  add_foreign_key "task_shares", "users", column: "user1_id"
  add_foreign_key "task_shares", "users", column: "user2_id"
  add_foreign_key "tasks", "users"
end

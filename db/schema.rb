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

ActiveRecord::Schema.define(version: 20130818095630) do

  create_table "attachments", force: true do |t|
    t.string   "image_url"
    t.integer  "resourceable_id"
    t.string   "resourceable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "initiator_id"
  end

  create_table "project_members", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_roles", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "regulation"
    t.boolean  "custom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_sprints", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "complete",   default: false
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "initiator_id"
  end

  create_table "sprints", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "title"
    t.integer  "initiator_id"
    t.text     "description"
    t.integer  "project_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.integer  "project_id"
    t.string   "short_desc"
    t.text     "long_desc"
    t.integer  "initiator_id"
    t.integer  "actor_id"
    t.integer  "velocity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sprint_id"
    t.integer  "priority"
  end

  create_table "stories_story_tags", id: false, force: true do |t|
    t.integer "story_id"
    t.integer "story_tag_id"
  end

  add_index "stories_story_tags", ["story_id", "story_tag_id"], name: "stories_story_tags_index", unique: true

  create_table "story_recipes", force: true do |t|
    t.integer  "story_id"
    t.text     "description"
    t.integer  "actor_id"
    t.integer  "initiator_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "story_tags", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "full_name"
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end

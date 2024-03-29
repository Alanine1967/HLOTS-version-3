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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121020185840) do

  create_table "episodes", :force => true do |t|
    t.integer  "number"
    t.text     "title"
    t.date     "first_shown"
    t.text     "synopsis"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "season_id"
  end

  add_index "episodes", ["number"], :name => "index_episodes_on_number"
  add_index "episodes", ["title"], :name => "index_episodes_on_title"

  create_table "participants", :force => true do |t|
    t.text     "role"
    t.text     "first_name"
    t.text     "middle_name"
    t.text     "surname"
    t.text     "biography"
    t.boolean  "cast"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "participants", ["first_name"], :name => "index_participants_on_first_name"
  add_index "participants", ["role"], :name => "index_participants_on_role"
  add_index "participants", ["surname"], :name => "index_participants_on_surname"

  create_table "roles", :force => true do |t|
    t.integer  "episode_id"
    t.integer  "participant_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "roles", ["episode_id"], :name => "index_roles_on_episode_id"
  add_index "roles", ["participant_id"], :name => "index_roles_on_participant_id"

  create_table "seasons", :force => true do |t|
    t.integer  "number"
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

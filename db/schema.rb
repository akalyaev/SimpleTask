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

ActiveRecord::Schema.define(:version => 20120114114050) do

  create_table "developers", :force => true do |t|
    t.integer "user_id"
    t.boolean "busy",    :default => false
  end

  create_table "statuses", :force => true do |t|
    t.string "name", :limit => 50
  end

  create_table "stories", :force => true do |t|
    t.string   "name",        :limit => 128,                :null => false
    t.text     "description"
    t.integer  "status",                     :default => 0
    t.integer  "user_id"
    t.integer  "points",                     :default => 3
    t.integer  "priority",                   :default => 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.integer "user_id"
    t.string  "surname",     :limit => 100
    t.string  "given_names", :limit => 100
    t.integer "gender",                     :default => 0
    t.string  "phone",       :limit => 50
    t.string  "mail",        :limit => 50
  end

  create_table "users", :force => true do |t|
    t.string   "username",       :limit => 128
    t.string   "salt",           :limit => 128
    t.string   "password",       :limit => 128
    t.boolean  "is_active",                     :default => true
    t.boolean  "is_super_admin",                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

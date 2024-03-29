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

ActiveRecord::Schema.define(:version => 20120616184919) do

  create_table "builds", :force => true do |t|
    t.string   "state"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "finished_at"
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "status"
    t.integer  "max_workers"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "repo"
    t.text     "description"
    t.integer  "ruby_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "organization_id"
    t.string   "branch"
    t.string   "test_type"
    t.string   "pattern"
  end

  create_table "rubies", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specs", :force => true do |t|
    t.string   "description"
    t.string   "exception"
    t.string   "line"
    t.string   "spec"
    t.integer  "build_id"
    t.string   "file_path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end

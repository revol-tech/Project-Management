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

ActiveRecord::Schema.define(:version => 20110328082530) do

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.datetime "deadline"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_groups", :force => true do |t|
    t.string   "title"
    t.datetime "deadline"
    t.text     "objective"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.datetime "deadline"
    t.text     "objective"
    t.boolean  "complete"
    t.string   "comment"
    t.integer  "task_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

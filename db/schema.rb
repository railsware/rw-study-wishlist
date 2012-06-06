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

ActiveRecord::Schema.define(:version => 20120605201908) do

  create_table "friendships", :force => true do |t|
    t.string   "person_id"
    t.string   "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["person_id"], :name => "index_friendships_on_person_id"

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "birthday"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "vk_id"
    t.string   "email"
    t.string   "privacy_type"
    t.boolean  "is_user"
    t.string   "role"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "vk_avatar_url"
  end

  add_index "people", ["vk_id"], :name => "index_people_on_vk_id"

  create_table "reservations", :force => true do |t|
    t.integer  "wish_id"
    t.integer  "person_id"
    t.datetime "reservation_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "reservations", ["person_id", "wish_id"], :name => "index_reservations_on_person_id_and_wish_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wishes", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "owner_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "rating"
  end

end

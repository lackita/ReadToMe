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

ActiveRecord::Schema.define(:version => 20131225151602) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.integer  "ordering"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "author"
    t.string   "status"
  end

  create_table "chapters", :force => true do |t|
    t.integer  "book_id"
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "track_file_name"
    t.string   "track_content_type"
    t.integer  "track_file_size"
    t.datetime "track_updated_at"
    t.decimal  "track_length"
  end

  create_table "playlist_items", :force => true do |t|
    t.integer  "playlist_id"
    t.integer  "chapter_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "playlists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.integer  "mp3_file_size"
    t.datetime "mp3_updated_at"
  end

end

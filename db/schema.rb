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

ActiveRecord::Schema.define(version: 20161022150126) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "musics", force: :cascade do |t|
    t.string   "artist"
    t.string   "song_name"
    t.string   "song_api"
    t.string   "genre"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "love_it"
    t.boolean  "not_my_kind"
    t.boolean  "like_it"
    t.boolean  "horrible"
  end

  add_index "musics", ["slug"], name: "index_musics_on_slug", unique: true

  create_table "musics_users", id: false, force: :cascade do |t|
    t.integer "music_id"
    t.integer "user_id"
  end

  add_index "musics_users", ["music_id"], name: "index_musics_users_on_music_id"
  add_index "musics_users", ["user_id"], name: "index_musics_users_on_user_id"

  create_table "playlists", force: :cascade do |t|
    t.text     "tracks"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "location"
    t.string   "birthday"
    t.string   "age_info"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
    t.string   "time_zone"
    t.string   "gender"
    t.boolean  "verified"
    t.string   "image"
  end

end

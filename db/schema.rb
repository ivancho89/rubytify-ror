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

ActiveRecord::Schema.define(version: 2021_08_11_233309) do

  create_table "albums", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "name"
    t.string "image"
    t.integer "spotify_id"
    t.string "spotify_url"
    t.integer "total_tracks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "popularity"
    t.string "genres"
    t.string "spotify_url"
    t.string "spotify_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "album_id"
    t.string "name"
    t.string "preview_url"
    t.integer "spotify_id"
    t.string "spotify_url"
    t.integer "duration_ms"
    t.boolean "explicit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
  add_foreign_key "albums", "artists", on_delete: :cascade
  add_foreign_key "songs", "albums", on_delete: :cascade
end

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

ActiveRecord::Schema.define(version: 20150303110941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_players", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_players", ["game_id", "player_id"], name: "index_game_players_on_game_id_and_player_id", using: :btree

  create_table "games", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "number_of_rounds"
    t.integer  "number_of_players"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_players", force: true do |t|
    t.integer "game_id"
    t.integer "player_id"
  end

  add_index "games_players", ["game_id", "player_id"], name: "index_games_players_on_game_id_and_player_id", unique: true, using: :btree

  create_table "player_rounds", force: true do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.integer  "bid"
    t.integer  "contracts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",      default: 0
  end

  add_index "player_rounds", ["player_id", "round_id"], name: "index_player_rounds_on_player_id_and_round_id", unique: true, using: :btree

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "game_id"
    t.integer  "number"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "trump_picker_id"
    t.string   "trumps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "trump"
  end

  add_index "rounds", ["game_id"], name: "index_rounds_on_game_id", using: :btree
  add_index "rounds", ["trump_picker_id"], name: "index_rounds_on_trump_picker_id", using: :btree

end

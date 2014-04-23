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

ActiveRecord::Schema.define(version: 20140423022249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competition_years", force: true do |t|
    t.integer "year", null: false
  end

  create_table "scores", force: true do |t|
    t.integer  "team_id",    null: false
    t.integer  "user_id",    null: false
    t.integer  "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["team_id"], name: "index_scores_on_team_id", using: :btree
  add_index "scores", ["user_id", "team_id"], name: "index_scores_on_user_id_and_team_id", using: :btree
  add_index "scores", ["user_id"], name: "index_scores_on_user_id", using: :btree

  create_table "team_members", force: true do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  add_index "team_members", ["team_id"], name: "index_team_members_on_team_id", using: :btree
  add_index "team_members", ["user_id"], name: "index_team_members_on_user_id", using: :btree

  create_table "teams", force: true do |t|
    t.string  "name",                null: false
    t.integer "competition_year_id", null: false
    t.text    "description"
    t.text    "homepage"
  end

  add_index "teams", ["competition_year_id"], name: "index_teams_on_competition_year_id", using: :btree

  create_table "users", force: true do |t|
    t.boolean  "active",      default: true, null: false
    t.integer  "bnr_team_id"
    t.string   "email",                      null: false
    t.string   "gravatar",                   null: false
    t.string   "name",                       null: false
    t.integer  "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

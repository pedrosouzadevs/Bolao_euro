# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_28_183911) do
  create_table "bet_champions", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_bet_champions_on_team_id"
    t.index ["user_id"], name: "index_bet_champions_on_user_id"
  end

  create_table "bets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "match_id", null: false
    t.integer "score_team_a", default: 0
    t.integer "score_team_b", default: 0
    t.integer "winner_id"
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_bets_on_match_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
    t.index ["winner_id"], name: "index_bets_on_winner_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "team_a_id", null: false
    t.integer "team_b_id", null: false
    t.integer "round_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_matches_on_round_id"
    t.index ["team_a_id"], name: "index_matches_on_team_a_id"
    t.index ["team_b_id"], name: "index_matches_on_team_b_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "score_team_a", default: 0
    t.integer "score_team_b", default: 0
    t.boolean "penalty", default: false
    t.integer "match_id", null: false
    t.integer "team_a_id", null: false
    t.integer "team_b_id", null: false
    t.integer "winner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_results_on_match_id"
    t.index ["team_a_id"], name: "index_results_on_team_a_id"
    t.index ["team_b_id"], name: "index_results_on_team_b_id"
    t.index ["winner_id"], name: "index_results_on_winner_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.integer "score", default: 0
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bet_champions", "teams"
  add_foreign_key "bet_champions", "users"
  add_foreign_key "bets", "matches"
  add_foreign_key "bets", "teams", column: "winner_id"
  add_foreign_key "bets", "users"
  add_foreign_key "matches", "rounds"
  add_foreign_key "matches", "teams", column: "team_a_id"
  add_foreign_key "matches", "teams", column: "team_b_id"
  add_foreign_key "results", "matches"
  add_foreign_key "results", "teams", column: "team_a_id"
  add_foreign_key "results", "teams", column: "team_b_id"
  add_foreign_key "results", "teams", column: "winner_id"
end

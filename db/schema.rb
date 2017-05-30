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

ActiveRecord::Schema.define(version: 20170511023556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_theaters", force: :cascade do |t|
    t.integer  "theater_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_theaters_on_movie_id", using: :btree
    t.index ["theater_id"], name: "index_movie_theaters_on_theater_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "title",      limit: 20
    t.integer  "censorship",             default: 0
    t.string   "storyline",  limit: 100
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "payment",           limit: 20, default: "debit"
    t.integer  "installment_times",            default: 0
    t.float    "total",                        default: 0.0
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "theater_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "capacity",   default: 0
    t.index ["theater_id"], name: "index_rooms_on_theater_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "room_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "date",                     null: false
    t.float    "price",      default: 0.0
    t.index ["movie_id"], name: "index_sessions_on_movie_id", using: :btree
    t.index ["room_id"], name: "index_sessions_on_room_id", using: :btree
  end

  create_table "theaters", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "address",    limit: 50
    t.string   "name",       limit: 30, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.boolean  "status"
    t.float    "price",       default: 0.0
    t.integer  "purchase_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "session_id"
    t.index ["purchase_id"], name: "index_tickets_on_purchase_id", using: :btree
    t.index ["session_id"], name: "index_tickets_on_session_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 50,                      null: false
    t.string   "email",           limit: 50,                      null: false
    t.integer  "age",                                             null: false
    t.string   "role",                       default: "customer"
    t.string   "password_digest",                                 null: false
    t.boolean  "student",                    default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_foreign_key "movie_theaters", "movies"
  add_foreign_key "movie_theaters", "theaters"
  add_foreign_key "purchases", "users"
  add_foreign_key "rooms", "theaters"
  add_foreign_key "sessions", "movies"
  add_foreign_key "sessions", "rooms"
  add_foreign_key "tickets", "purchases"
  add_foreign_key "tickets", "sessions"
end

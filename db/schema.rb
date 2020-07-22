# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_21_124008) do

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "appointment_date"
    t.boolean "public"
    t.integer "location_id", null: false
    t.integer "user_id", null: false
    t.index ["location_id"], name: "index_appointments_on_location_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "state"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "portfolio_name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "public"
    t.integer "user_id", null: false
    t.integer "appointment_id", null: false
    t.integer "portfolio_id", null: false
    t.index ["appointment_id"], name: "index_posts_on_appointment_id"
    t.index ["portfolio_id"], name: "index_posts_on_portfolio_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.integer "quantity"
    t.integer "portfolio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["portfolio_id"], name: "index_stocks_on_portfolio_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "locations"
  add_foreign_key "appointments", "users"
  add_foreign_key "portfolios", "users"
  add_foreign_key "posts", "appointments"
  add_foreign_key "posts", "portfolios"
  add_foreign_key "posts", "users"
  add_foreign_key "stocks", "portfolios"
end

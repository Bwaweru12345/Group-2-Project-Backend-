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

ActiveRecord::Schema[7.0].define(version: 2023_07_08_185651) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.decimal "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.boolean "is_paid"
    t.date "due_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "data", force: :cascade do |t|
    t.decimal "savings"
    t.decimal "locked_savings"
    t.decimal "goal"
    t.decimal "loan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "personals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personals_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.boolean "deposited"
    t.decimal "amount"
    t.string "recipient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bills", "users"
  add_foreign_key "incomes", "users"
  add_foreign_key "personals", "users"
end

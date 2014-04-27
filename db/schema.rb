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

ActiveRecord::Schema.define(version: 20140427123945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_expenses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.date     "date"
    t.text     "description"
    t.string   "currency"
    t.boolean  "raport",                              default: false
    t.string   "file"
    t.decimal  "value",       precision: 8, scale: 2
    t.decimal  "value_eur",   precision: 8, scale: 2
    t.integer  "raport_id"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "registration"
    t.string   "vat"
    t.text     "address"
    t.string   "acc_lei"
    t.string   "acc_eur"
    t.string   "bank"
    t.string   "capital"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_invoices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.date     "date"
    t.decimal  "total_value", precision: 8, scale: 2
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.string   "tax_rate"
    t.decimal  "net_value",   precision: 8, scale: 2
    t.decimal  "tax_value",   precision: 8, scale: 2
    t.string   "currency"
    t.string   "delegat"
    t.string   "ci"
    t.string   "eliberat"
    t.string   "transport"
    t.integer  "user_id"
  end

  add_index "credit_invoices", ["number"], name: "index_credit_invoices_on_number", unique: true, using: :btree

  create_table "credit_notes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.string   "start"
    t.string   "stop"
    t.integer  "week"
    t.decimal  "value",             precision: 8, scale: 2
    t.text     "notes"
    t.boolean  "paid"
    t.string   "file"
    t.string   "currency"
    t.integer  "credit_invoice_id"
    t.integer  "truck_id"
    t.integer  "order_nr"
  end

  add_index "credit_notes", ["number"], name: "index_credit_notes_on_number", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.date     "date"
    t.string   "km"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "truck_id"
  end

  create_table "globals", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "raports", force: true do |t|
    t.string   "name"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "trucks", force: true do |t|
    t.string   "registration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cnp"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "language"
    t.string   "remember_token"
    t.boolean  "admin"
    t.boolean  "activated",       default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end

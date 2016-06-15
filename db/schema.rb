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

ActiveRecord::Schema.define(version: 20160615120835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "file",            limit: 255
    t.integer  "attachable_id"
    t.string   "attachable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["attachable_id", "attachable_type"], name: "index_attachments_on_attachable_id_and_attachable_type", using: :btree

  create_table "bonus", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.string   "comment",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_id"
  end

  create_table "bonuses", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.string   "comment",    limit: 255
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "registration", limit: 255
    t.string   "vat",          limit: 255
    t.text     "address"
    t.string   "acc_lei",      limit: 255
    t.string   "acc_eur",      limit: 255
    t.string   "bank",         limit: 255
    t.string   "capital",      limit: 255
    t.string   "phone",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",        limit: 255
    t.integer  "create_id"
    t.integer  "update_id"
    t.string   "contact",      limit: 255
  end

  create_table "credit_invoices", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number",      limit: 255
    t.date     "date"
    t.decimal  "total_value",             precision: 8, scale: 2
    t.integer  "client_id"
    t.string   "tax_rate",    limit: 255
    t.decimal  "net_value",               precision: 8, scale: 2
    t.decimal  "tax_value",               precision: 8, scale: 2
    t.string   "currency",    limit: 255
    t.string   "delegat",     limit: 255
    t.string   "ci",          limit: 255
    t.string   "eliberat",    limit: 255
    t.string   "transport",   limit: 255
    t.integer  "user_id"
    t.integer  "create_id"
    t.integer  "update_id"
  end

  add_index "credit_invoices", ["number"], name: "index_credit_invoices_on_number", unique: true, using: :btree

  create_table "credit_notes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number",            limit: 255
    t.string   "start",             limit: 255
    t.string   "stop",              limit: 255
    t.integer  "week"
    t.decimal  "value",                         precision: 8, scale: 2
    t.text     "notes"
    t.boolean  "paid",                                                  default: false
    t.string   "currency",          limit: 255
    t.integer  "credit_invoice_id"
    t.integer  "truck_id"
    t.integer  "order_nr"
    t.integer  "create_id"
    t.integer  "update_id"
  end

  add_index "credit_notes", ["number"], name: "index_credit_notes_on_number", unique: true, using: :btree

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "cnp",        limit: 255
    t.string   "bank_ron",   limit: 255
    t.string   "bank_eur",   limit: 255
    t.boolean  "activ",                  default: true
  end

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.string   "km",         limit: 255
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "truck_id"
    t.integer  "create_id"
    t.integer  "update_id"
  end

  create_table "extern_expenses", force: :cascade do |t|
    t.string   "number",      limit: 255
    t.date     "date"
    t.text     "description"
    t.decimal  "value",                   precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency",    limit: 255
    t.integer  "supplier_id"
    t.integer  "create_id"
    t.integer  "update_id"
  end

  create_table "national_expenses", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number",      limit: 255
    t.date     "date"
    t.text     "description"
    t.decimal  "value",                   precision: 8, scale: 2
    t.integer  "supplier_id"
    t.string   "paid_by",     limit: 255
    t.integer  "create_id"
    t.integer  "update_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "payment_id"
  end

  create_table "papers", force: :cascade do |t|
    t.string   "description",   limit: 255
    t.date     "expire"
    t.integer  "document_id"
    t.string   "document_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments",      limit: 255
    t.integer  "create_id"
    t.integer  "update_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "salar_ron"
    t.integer  "salar_eur"
    t.integer  "avans"
    t.integer  "rest"
    t.date     "month"
    t.integer  "per_day"
    t.integer  "total"
    t.boolean  "diurna",      default: true
    t.integer  "days"
    t.integer  "employee_id"
    t.boolean  "updated",     default: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "ids"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "trip_expenses", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number",      limit: 255
    t.date     "date"
    t.text     "description"
    t.decimal  "value",                   precision: 8, scale: 2
    t.decimal  "value_eur",               precision: 8, scale: 2
    t.string   "currency",    limit: 255
    t.integer  "report_id"
    t.string   "intnr"
    t.boolean  "card",                                            default: true
    t.integer  "create_id"
    t.integer  "update_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "registration", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vin",          limit: 255
    t.integer  "create_id"
    t.integer  "update_id"
    t.boolean  "truck"
    t.boolean  "sold"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "cnp",             limit: 255
    t.string   "username",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.string   "language",        limit: 255
    t.string   "remember_token",  limit: 255
    t.boolean  "admin",                       default: false
    t.boolean  "activated",                   default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end

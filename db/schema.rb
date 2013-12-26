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

ActiveRecord::Schema.define(version: 20131226180355) do

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
    t.integer  "number"
    t.date     "date"
    t.decimal  "value",      precision: 8, scale: 2
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.string   "currency"
    t.string   "tax_rate"
  end

  create_table "credit_notes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.string   "start"
    t.string   "stop"
    t.integer  "week"
    t.decimal  "value",      precision: 8, scale: 2
    t.text     "notes"
    t.boolean  "paid"
    t.string   "file"
    t.string   "currency"
  end

  create_table "debit_invoices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
  end

end

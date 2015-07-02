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

ActiveRecord::Schema.define(version: 20150701071852) do

  create_table "cauhois", force: :cascade do |t|
    t.text "cauhoi", limit: 65535
  end

  create_table "dapandungs", force: :cascade do |t|
    t.integer "cauhoi_id", limit: 4
    t.text    "dapandung", limit: 65535
  end

  create_table "dapans", force: :cascade do |t|
    t.integer "cauhoi_id", limit: 4
    t.text    "dapan",     limit: 65535
  end

  create_table "diems", force: :cascade do |t|
    t.integer  "monhoc_id",  limit: 4, default: 0, null: false
    t.integer  "user_id",    limit: 4, default: 0, null: false
    t.integer  "lanthi",     limit: 4, default: 0, null: false
    t.integer  "diemthi",    limit: 4, default: 0, null: false
    t.integer  "loaithi_id", limit: 4, default: 0, null: false
    t.datetime "thoigian"
  end

  create_table "khoas", force: :cascade do |t|
    t.string "tenkhoa", limit: 255, default: "", null: false
  end

  create_table "loaithis", force: :cascade do |t|
    t.string "name", limit: 255,   default: "", null: false
    t.text   "desc", limit: 65535
  end

  create_table "lops", force: :cascade do |t|
    t.string  "tenlop",  limit: 255, default: "", null: false
    t.integer "khoa_id", limit: 4,   default: 0,  null: false
  end

  create_table "monhocs", force: :cascade do |t|
    t.string  "tenmonhoc", limit: 255, default: "1", null: false
    t.integer "sotinchi",  limit: 4,   default: 1,   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 255,   default: "", null: false
    t.text   "desc", limit: 65535
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "gioitinh",               limit: 255, default: "", null: false
    t.integer  "role_id",                limit: 4,   default: 0,  null: false
    t.integer  "lop_id",                 limit: 4,   default: 0,  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20160331023026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.integer  "parent_id",  default: 0
    t.text     "content",    default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "comments", ["image_id"], name: "index_comments_on_image_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "follow_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id",                  null: false
    t.string   "img_url",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "description", default: ""
  end

  add_index "images", ["category_id"], name: "index_images_on_category_id", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "likeds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "image_id"
  end

  add_index "likeds", ["image_id"], name: "index_likeds_on_image_id", using: :btree
  add_index "likeds", ["user_id"], name: "index_likeds_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            default: ""
    t.string   "username",                        null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.boolean  "visible",         default: true
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar",          default: ""
  end

  add_foreign_key "comments", "images"
  add_foreign_key "comments", "users"
  add_foreign_key "follows", "users"
  add_foreign_key "images", "categories"
  add_foreign_key "images", "users"
  add_foreign_key "likeds", "images"
  add_foreign_key "likeds", "users"
end

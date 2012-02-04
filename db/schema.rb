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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120204105308) do

  create_table "confs", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diamonds", :force => true do |t|
    t.string   "name"
    t.integer  "weight"
    t.integer  "rate_per_carat"
    t.integer  "price"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ornaments", :force => true do |t|
    t.string   "name"
    t.integer  "finesse"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", :force => true do |t|
    t.string   "name"
    t.float    "net_weight"
    t.float    "gross_weight"
    t.integer  "labour"
    t.integer  "ornament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stones", :force => true do |t|
    t.string   "name"
    t.integer  "weight"
    t.integer  "rate_per_carat"
    t.integer  "price"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wastages", :force => true do |t|
    t.integer  "from"
    t.integer  "to"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

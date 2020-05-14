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

ActiveRecord::Schema.define(version: 2020_05_14_120307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "client_services", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.bigint "client_id", null: false
    t.uuid "service_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "started_at", null: false
    t.datetime "finished_at"
    t.string "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "performer_id"
    t.index ["client_id"], name: "index_client_services_on_client_id"
    t.index ["performer_id"], name: "index_client_services_on_performer_id"
    t.index ["service_id"], name: "index_client_services_on_service_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.string "phone"
    t.string "email"
    t.date "dob"
    t.string "city"
    t.string "address"
    t.string "area"
    t.string "description"
    t.integer "client_type", default: 0, null: false
    t.integer "code", default: 0, null: false
    t.integer "objectivity", default: 0, null: false
    t.integer "marital_status", default: 0, null: false
    t.integer "social_status", default: 0, null: false
    t.integer "source", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "performers", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.integer "performer_type", default: 0, null: false
    t.string "phone", null: false
    t.string "email"
    t.string "address"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "title", null: false
    t.integer "quantity"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "client_services", "clients"
  add_foreign_key "client_services", "performers"
  add_foreign_key "client_services", "services"
end

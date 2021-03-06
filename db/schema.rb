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

ActiveRecord::Schema.define(version: 20180213162708) do

  create_table "diaries", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "diaries_prescriptions", id: false, force: :cascade do |t|
    t.integer "diary_id", null: false
    t.integer "prescription_id", null: false
    t.index ["diary_id", "prescription_id"], name: "index_diaries_prescriptions_on_diary_id_and_prescription_id"
    t.index ["prescription_id", "diary_id"], name: "index_diaries_prescriptions_on_prescription_id_and_diary_id"
  end

  create_table "diary_drugs", force: :cascade do |t|
    t.integer "diary_id"
    t.integer "drug_id"
    t.integer "result"
    t.text "comments"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_diary_drugs_on_diary_id"
    t.index ["drug_id"], name: "index_diary_drugs_on_drug_id"
  end

  create_table "drug_entries", force: :cascade do |t|
    t.integer "drug_id"
    t.integer "entry_id"
    t.integer "result"
    t.text "comments"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_drug_entries_on_drug_id"
    t.index ["entry_id"], name: "index_drug_entries_on_entry_id"
  end

  create_table "drugs", force: :cascade do |t|
    t.string "brand"
    t.string "name"
    t.string "dose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prescription_id"
    t.integer "user_id"
    t.index ["prescription_id"], name: "index_drugs_on_prescription_id"
    t.index ["user_id"], name: "index_drugs_on_user_id"
  end

  create_table "drugs_prescriptions", id: false, force: :cascade do |t|
    t.integer "drug_id", null: false
    t.integer "prescription_id", null: false
    t.index ["drug_id", "prescription_id"], name: "index_drugs_prescriptions_on_drug_id_and_prescription_id"
    t.index ["prescription_id", "drug_id"], name: "index_drugs_prescriptions_on_prescription_id_and_drug_id"
  end

  create_table "entries", force: :cascade do |t|
    t.date "date"
    t.integer "diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_entries_on_diary_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "clinic"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "diary_id"
    t.index ["diary_id"], name: "index_prescriptions_on_diary_id"
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

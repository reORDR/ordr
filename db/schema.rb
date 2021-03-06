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

ActiveRecord::Schema.define(version: 20151021225927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.string   "phone"
    t.string   "linkedin_url"
    t.integer  "job_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "contacts", ["job_id"], name: "index_contacts_on_job_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.boolean  "resume"
    t.boolean  "cover_letter"
    t.boolean  "portfolio"
    t.boolean  "certifications"
    t.boolean  "references"
    t.boolean  "recommendations"
    t.boolean  "done"
    t.integer  "job_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "documents", ["job_id"], name: "index_documents_on_job_id", using: :btree

  create_table "interviews", force: :cascade do |t|
    t.string   "format"
    t.boolean  "thank_you",  default: false
    t.datetime "date"
    t.integer  "job_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "interviews", ["job_id"], name: "index_interviews_on_job_id", using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.boolean  "sent",       default: false
    t.date     "date"
    t.integer  "job_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "job_applications", ["job_id"], name: "index_job_applications_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "company_name"
    t.string   "url"
    t.datetime "due_date"
    t.string   "source"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "networks", force: :cascade do |t|
    t.boolean  "plans",      default: false
    t.date     "date"
    t.boolean  "done",       default: false
    t.integer  "job_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "networks", ["job_id"], name: "index_networks_on_job_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "body"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "notes", ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id", using: :btree

  create_table "researches", force: :cascade do |t|
    t.integer "job_id"
    t.text    "company_mission"
    t.text    "company_goals"
    t.text    "current_projects"
    t.boolean "done"
  end

  add_index "researches", ["job_id"], name: "index_researches_on_job_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contacts", "jobs"
  add_foreign_key "interviews", "jobs"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "networks", "jobs"
  add_foreign_key "researches", "jobs"
end

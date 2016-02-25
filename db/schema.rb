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

ActiveRecord::Schema.define(version: 20160225231244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "areas", ["name"], name: "index_areas_on_name", using: :btree

  create_table "areas_courses", id: false, force: :cascade do |t|
    t.integer "area_id",   null: false
    t.integer "course_id", null: false
  end

  add_index "areas_courses", ["area_id", "course_id"], name: "index_areas_courses_on_area_id_and_course_id", using: :btree
  add_index "areas_courses", ["course_id", "area_id"], name: "index_areas_courses_on_course_id_and_area_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "category_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_types", ["category_id"], name: "index_category_types_on_category_id", using: :btree
  add_index "category_types", ["name"], name: "index_category_types_on_name", using: :btree

  create_table "category_types_companies", id: false, force: :cascade do |t|
    t.integer "category_type_id", null: false
    t.integer "company_id",       null: false
  end

  add_index "category_types_companies", ["category_type_id", "company_id"], name: "category_type_company_index", using: :btree
  add_index "category_types_companies", ["company_id", "category_type_id"], name: "company_category_type_index", using: :btree

  create_table "certificates", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "certificates", ["name"], name: "index_certificates_on_name", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "name"
    t.string   "phone"
    t.string   "contact"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
    t.string   "site"
    t.integer  "user_id"
    t.boolean  "marketing"
    t.integer  "category_type_id"
  end

  add_index "companies", ["category_type_id"], name: "index_companies_on_category_type_id", using: :btree
  add_index "companies", ["cnpj"], name: "index_companies_on_cnpj", unique: true, using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree
  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "about"
    t.string   "place"
    t.integer  "company_id"
    t.string   "rating"
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "total_hours"
    t.integer  "mode_id"
    t.integer  "area_id"
    t.integer  "certificate_id"
    t.string   "payment_method"
    t.text     "requirements"
    t.string   "content"
    t.string   "keywords"
    t.string   "lecturer_name"
    t.text     "lecturer_resume"
    t.string   "link_inscription"
    t.integer  "category_type_id"
    t.integer  "price_centavos",   default: 0,     null: false
    t.string   "price_currency",   default: "BRL", null: false
    t.boolean  "free"
    t.integer  "user_id"
  end

  add_index "courses", ["area_id"], name: "index_courses_on_area_id", using: :btree
  add_index "courses", ["category_type_id"], name: "index_courses_on_category_type_id", using: :btree
  add_index "courses", ["certificate_id"], name: "index_courses_on_certificate_id", using: :btree
  add_index "courses", ["company_id"], name: "index_courses_on_company_id", using: :btree
  add_index "courses", ["mode_id"], name: "index_courses_on_mode_id", using: :btree
  add_index "courses", ["title"], name: "index_courses_on_title", using: :btree
  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "enderecos", force: :cascade do |t|
    t.string   "cep"
    t.string   "logradouro"
    t.string   "bairro"
    t.string   "numero"
    t.string   "cidade"
    t.string   "estado"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "course_id"
  end

  add_index "enderecos", ["company_id"], name: "index_enderecos_on_company_id", using: :btree
  add_index "enderecos", ["course_id"], name: "index_enderecos_on_course_id", using: :btree
  add_index "enderecos", ["user_id"], name: "index_enderecos_on_user_id", using: :btree

  create_table "modes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "modes", ["name"], name: "index_modes_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "category_types", "categories"
  add_foreign_key "companies", "category_types"
  add_foreign_key "companies", "users"
  add_foreign_key "courses", "areas"
  add_foreign_key "courses", "category_types"
  add_foreign_key "courses", "certificates"
  add_foreign_key "courses", "companies"
  add_foreign_key "courses", "modes"
  add_foreign_key "courses", "users"
  add_foreign_key "enderecos", "companies"
  add_foreign_key "enderecos", "courses"
  add_foreign_key "enderecos", "users"
end

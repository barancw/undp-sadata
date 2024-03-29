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

ActiveRecord::Schema.define(version: 20170107200839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "short_title"
    t.string   "description"
    t.string   "url"
    t.integer  "taxonomy_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "draft",       default: false
    t.integer  "manager_id"
    t.index ["draft"], name: "index_categories_on_draft", using: :btree
    t.index ["manager_id"], name: "index_categories_on_manager_id", using: :btree
    t.index ["taxonomy_id"], name: "index_categories_on_taxonomy_id", using: :btree
  end

  create_table "due_dates", force: :cascade do |t|
    t.integer  "indicator_id"
    t.date     "due_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "draft",        default: false
    t.index ["draft"], name: "index_due_dates_on_draft", using: :btree
    t.index ["indicator_id"], name: "index_due_dates_on_indicator_id", using: :btree
  end

  create_table "indicators", force: :cascade do |t|
    t.string   "title",                       null: false
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "draft",       default: false
    t.integer  "manager_id"
    t.index ["draft"], name: "index_indicators_on_draft", using: :btree
    t.index ["manager_id"], name: "index_indicators_on_manager_id", using: :btree
  end

  create_table "measure_categories", force: :cascade do |t|
    t.integer  "measure_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "measure_indicators", force: :cascade do |t|
    t.integer  "measure_id"
    t.integer  "indicator_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "measures", force: :cascade do |t|
    t.string   "title",                       null: false
    t.text     "description"
    t.text     "target_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "draft",       default: false
    t.index ["draft"], name: "index_measures_on_draft", using: :btree
  end

  create_table "progress_reports", force: :cascade do |t|
    t.integer  "indicator_id"
    t.integer  "due_date_id"
    t.string   "title"
    t.text     "description"
    t.string   "document_url"
    t.boolean  "document_public"
    t.boolean  "draft"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["due_date_id"], name: "index_progress_reports_on_due_date_id", using: :btree
    t.index ["indicator_id"], name: "index_progress_reports_on_indicator_id", using: :btree
  end

  create_table "recommendation_categories", force: :cascade do |t|
    t.integer  "recommendation_id"
    t.integer  "category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "recommendation_measures", force: :cascade do |t|
    t.integer  "recommendation_id"
    t.integer  "measure_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["measure_id"], name: "index_recommendation_measures_on_measure_id", using: :btree
    t.index ["recommendation_id"], name: "index_recommendation_measures_on_recommendation_id", using: :btree
  end

  create_table "recommendations", force: :cascade do |t|
    t.string   "title",                      null: false
    t.integer  "number",                     null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "draft",      default: false
    t.index ["draft"], name: "index_recommendations_on_draft", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "friendly_name", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string   "title",                                null: false
    t.boolean  "tags_recommendations"
    t.boolean  "tags_measures"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "draft",                default: false
    t.boolean  "allow_multiple"
    t.index ["draft"], name: "index_taxonomies_on_draft", using: :btree
  end

  create_table "user_categories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

end

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

ActiveRecord::Schema.define(version: 20170211041256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accreditations", force: :cascade do |t|
    t.integer  "qualification_id"
    t.integer  "accredited_id"
    t.string   "accredited_type"
    t.string   "number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["accredited_id"], name: "index_accreditations_on_accredited_id", using: :btree
    t.index ["accredited_type"], name: "index_accreditations_on_accredited_type", using: :btree
    t.index ["qualification_id"], name: "index_accreditations_on_qualification_id", using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "province_id"
    t.integer  "municipality_or_city_id"
    t.integer  "barangay_id"
    t.integer  "addressable_id"
    t.integer  "addressable_type"
    t.boolean  "current",                 default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
    t.index ["addressable_type"], name: "index_addresses_on_addressable_type", using: :btree
    t.index ["barangay_id"], name: "index_addresses_on_barangay_id", using: :btree
    t.index ["municipality_or_city_id"], name: "index_addresses_on_municipality_or_city_id", using: :btree
    t.index ["province_id"], name: "index_addresses_on_province_id", using: :btree
  end

  create_table "assessment_centers", force: :cascade do |t|
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "slug"
    t.index ["institution_id"], name: "index_assessment_centers_on_institution_id", using: :btree
  end

  create_table "assessments", force: :cascade do |t|
    t.integer  "assessor_id"
    t.integer  "assessee_id"
    t.string   "assessee_type"
    t.datetime "date"
    t.integer  "result"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "assessment_center_id"
    t.index ["assessee_id"], name: "index_assessments_on_assessee_id", using: :btree
    t.index ["assessee_type"], name: "index_assessments_on_assessee_type", using: :btree
    t.index ["assessor_id"], name: "index_assessments_on_assessor_id", using: :btree
  end

  create_table "assessors", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "assessment_center_id"
    t.index ["assessment_center_id"], name: "index_assessors_on_assessment_center_id", using: :btree
    t.index ["client_id"], name: "index_assessors_on_client_id", using: :btree
  end

  create_table "barangays", force: :cascade do |t|
    t.string   "name"
    t.integer  "municipality_or_city_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["municipality_or_city_id"], name: "index_barangays_on_municipality_or_city_id", using: :btree
    t.index ["name"], name: "index_barangays_on_name", unique: true, using: :btree
  end

  create_table "certification_levels", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifications", force: :cascade do |t|
    t.integer  "certified_id"
    t.string   "certified_type"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "certification_level_id"
    t.datetime "issue_date"
    t.datetime "expiry_date"
    t.string   "number"
    t.string   "type"
    t.integer  "competency_id"
    t.integer  "qualification_id"
    t.string   "slug"
    t.index ["certification_level_id"], name: "index_certifications_on_certification_level_id", using: :btree
    t.index ["certified_id"], name: "index_certifications_on_certified_id", using: :btree
    t.index ["certified_type"], name: "index_certifications_on_certified_type", using: :btree
    t.index ["competency_id"], name: "index_certifications_on_competency_id", using: :btree
    t.index ["qualification_id"], name: "index_certifications_on_qualification_id", using: :btree
    t.index ["slug"], name: "index_certifications_on_slug", unique: true, using: :btree
    t.index ["type"], name: "index_certifications_on_type", using: :btree
  end

  create_table "client_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "sex"
    t.string   "contact_number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "slug"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["slug"], name: "index_clients_on_slug", unique: true, using: :btree
  end

  create_table "competencies", force: :cascade do |t|
    t.integer  "qualification_id"
    t.string   "unit_code"
    t.string   "unit_title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["qualification_id"], name: "index_competencies_on_qualification_id", using: :btree
  end

  create_table "completed_trainings", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "training_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "registry_id"
    t.integer  "region_id"
    t.integer  "province_id"
    t.string   "reference_number"
    t.integer  "modality_id"
    t.integer  "client_type_id"
    t.index ["client_id"], name: "index_completed_trainings_on_client_id", using: :btree
    t.index ["client_type_id"], name: "index_completed_trainings_on_client_type_id", using: :btree
    t.index ["modality_id"], name: "index_completed_trainings_on_modality_id", using: :btree
    t.index ["province_id"], name: "index_completed_trainings_on_province_id", using: :btree
    t.index ["reference_number"], name: "index_completed_trainings_on_reference_number", using: :btree
    t.index ["region_id"], name: "index_completed_trainings_on_region_id", using: :btree
    t.index ["registry_id"], name: "index_completed_trainings_on_registry_id", using: :btree
    t.index ["training_id"], name: "index_completed_trainings_on_training_id", using: :btree
  end

  create_table "educational_attainments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "educational_attainment_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["client_id"], name: "index_educations_on_client_id", using: :btree
    t.index ["educational_attainment_id"], name: "index_educations_on_educational_attainment_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "institution_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_institution_types_on_name", using: :btree
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "slug"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "issuances", force: :cascade do |t|
    t.string   "type"
    t.string   "reference_number"
    t.integer  "issuable_id"
    t.string   "issuable_type"
    t.datetime "issue_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["issuable_id"], name: "index_issuances_on_issuable_id", using: :btree
    t.index ["issuable_type"], name: "index_issuances_on_issuable_type", using: :btree
    t.index ["type"], name: "index_issuances_on_type", using: :btree
  end

  create_table "modalities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipality_or_cities", force: :cascade do |t|
    t.integer  "locality_type"
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["locality_type"], name: "index_municipality_or_cities_on_locality_type", using: :btree
    t.index ["name"], name: "index_municipality_or_cities_on_name", unique: true, using: :btree
    t.index ["province_id"], name: "index_municipality_or_cities_on_province_id", using: :btree
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_provinces_on_region_id", using: :btree
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "name"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_qualifications_on_sector_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registries", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "spreadsheet_file_name"
    t.string   "spreadsheet_content_type"
    t.integer  "spreadsheet_file_size"
    t.datetime "spreadsheet_updated_at"
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_centers", force: :cascade do |t|
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "slug"
    t.index ["institution_id"], name: "index_training_centers_on_institution_id", using: :btree
    t.index ["slug"], name: "index_training_centers_on_slug", unique: true, using: :btree
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "trainer_id"
    t.integer  "training_center_id"
    t.integer  "competency_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "trainor_id"
    t.index ["competency_id"], name: "index_trainings_on_competency_id", using: :btree
    t.index ["trainer_id"], name: "index_trainings_on_trainer_id", using: :btree
    t.index ["training_center_id"], name: "index_trainings_on_training_center_id", using: :btree
    t.index ["trainor_id"], name: "index_trainings_on_trainor_id", using: :btree
  end

  create_table "trainors", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_trainors_on_client_id", using: :btree
  end

  add_foreign_key "accreditations", "qualifications"
  add_foreign_key "addresses", "barangays"
  add_foreign_key "addresses", "municipality_or_cities"
  add_foreign_key "addresses", "provinces"
  add_foreign_key "assessment_centers", "institutions"
  add_foreign_key "assessors", "assessment_centers"
  add_foreign_key "assessors", "clients"
  add_foreign_key "barangays", "municipality_or_cities"
  add_foreign_key "certifications", "certification_levels"
  add_foreign_key "certifications", "competencies"
  add_foreign_key "certifications", "qualifications"
  add_foreign_key "competencies", "qualifications"
  add_foreign_key "completed_trainings", "clients"
  add_foreign_key "completed_trainings", "modalities"
  add_foreign_key "completed_trainings", "provinces"
  add_foreign_key "completed_trainings", "regions"
  add_foreign_key "completed_trainings", "registries"
  add_foreign_key "completed_trainings", "trainings"
  add_foreign_key "educations", "clients"
  add_foreign_key "educations", "educational_attainments"
  add_foreign_key "municipality_or_cities", "provinces"
  add_foreign_key "provinces", "regions"
  add_foreign_key "training_centers", "institutions"
  add_foreign_key "trainings", "competencies"
  add_foreign_key "trainings", "trainors"
  add_foreign_key "trainors", "clients"
end

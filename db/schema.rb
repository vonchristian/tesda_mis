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

ActiveRecord::Schema.define(version: 20170130031231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accreditations", force: :cascade do |t|
    t.integer  "qualification_id"
    t.integer  "assessor_id"
    t.string   "number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["assessor_id"], name: "index_accreditations_on_assessor_id", using: :btree
    t.index ["qualification_id"], name: "index_accreditations_on_qualification_id", using: :btree
  end

  create_table "assessment_centers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.integer  "trainee_id"
    t.integer  "assessor_id"
    t.datetime "date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "trainee_training_id"
    t.integer  "result"
    t.datetime "assessment_date"
    t.datetime "application_date"
    t.index ["assessor_id"], name: "index_assessments_on_assessor_id", using: :btree
    t.index ["trainee_id"], name: "index_assessments_on_trainee_id", using: :btree
    t.index ["trainee_training_id"], name: "index_assessments_on_trainee_training_id", using: :btree
  end

  create_table "assessors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.string   "type"
    t.integer  "trainee_id"
    t.datetime "date_issued"
    t.datetime "expiry_date"
    t.string   "number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "certification_level_id"
    t.integer  "certified_id"
    t.string   "certified_type"
    t.index ["certification_level_id"], name: "index_certificates_on_certification_level_id", using: :btree
    t.index ["certified_id"], name: "index_certificates_on_certified_id", using: :btree
    t.index ["certified_type"], name: "index_certificates_on_certified_type", using: :btree
    t.index ["number"], name: "index_certificates_on_number", using: :btree
    t.index ["trainee_id"], name: "index_certificates_on_trainee_id", using: :btree
    t.index ["type"], name: "index_certificates_on_type", using: :btree
  end

  create_table "certification_levels", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competencies", force: :cascade do |t|
    t.integer  "qualification_id"
    t.string   "unit_code"
    t.string   "unit_title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["qualification_id"], name: "index_competencies_on_qualification_id", using: :btree
  end

  create_table "educational_attainments", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "trainee_id"
    t.integer  "educational_attainment_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["educational_attainment_id"], name: "index_educations_on_educational_attainment_id", using: :btree
    t.index ["trainee_id"], name: "index_educations_on_trainee_id", using: :btree
  end

  create_table "issuances", force: :cascade do |t|
    t.integer  "certificate_id"
    t.string   "serial_number"
    t.date     "application_date"
    t.date     "claim_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["certificate_id"], name: "index_issuances_on_certificate_id", using: :btree
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainee_trainings", force: :cascade do |t|
    t.integer  "trainee_id"
    t.integer  "training_id"
    t.string   "reference_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["trainee_id"], name: "index_trainee_trainings_on_trainee_id", using: :btree
    t.index ["training_id"], name: "index_trainee_trainings_on_training_id", using: :btree
  end

  create_table "trainees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "sex"
    t.string   "contact_number"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "educational_attainment_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["educational_attainment_id"], name: "index_trainees_on_educational_attainment_id", using: :btree
  end

  create_table "training_centers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "competency_id"
    t.index ["competency_id"], name: "index_trainings_on_competency_id", using: :btree
  end

  add_foreign_key "accreditations", "assessors"
  add_foreign_key "accreditations", "qualifications"
  add_foreign_key "assessments", "assessors"
  add_foreign_key "assessments", "trainee_trainings"
  add_foreign_key "assessments", "trainees"
  add_foreign_key "certificates", "certification_levels"
  add_foreign_key "certificates", "trainees"
  add_foreign_key "competencies", "qualifications"
  add_foreign_key "educations", "educational_attainments"
  add_foreign_key "educations", "trainees"
  add_foreign_key "issuances", "certificates"
  add_foreign_key "provinces", "regions"
  add_foreign_key "trainee_trainings", "trainees"
  add_foreign_key "trainee_trainings", "trainings"
  add_foreign_key "trainees", "educational_attainments"
  add_foreign_key "trainings", "competencies"
end

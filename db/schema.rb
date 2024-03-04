# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_19_104151) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "clinic_ips", force: :cascade do |t|
    t.string "ip"
    t.datetime "last_login"
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_clinic_ips_on_clinic_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "postal_code"
    t.string "region"
    t.text "address"
    t.string "municipalities"
    t.string "building_name"
    t.string "floors"
    t.string "fax_number"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "representative_first_name"
    t.string "representative_last_name"
    t.string "representative_wonder1"
    t.string "representative_wonder2"
    t.string "charge1_first_name"
    t.string "charge1_last_name"
    t.string "charge1_wonder1"
    t.string "charge1_wonder2"
    t.string "charge2_first_name"
    t.string "charge2_last_name"
    t.string "charge2_wonder1"
    t.string "charge2_wonder2"
    t.index ["user_id"], name: "index_clinics_on_user_id"
  end

  create_table "contract_types", force: :cascade do |t|
    t.string "contract_type_code"
    t.string "contract_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remarks"
    t.string "master_name"
  end

  create_table "counselings", force: :cascade do |t|
    t.string "resp_dr"
    t.string "resp_couns_staff"
    t.date "first_visit"
    t.date "re_first_visit"
    t.date "second_visit"
    t.date "p_consult"
    t.date "inspection"
    t.date "treat_plan"
    t.date "prostho"
    t.date "denture"
    t.date "whitening"
    t.date "implant"
    t.date "invisalign"
    t.date "other_correc"
    t.date "micro"
    t.date "maintainance"
    t.date "main_resv_date"
    t.string "main_trans"
    t.string "type_agree"
    t.string "prostho_type"
    t.string "no_of_implant"
    t.string "site"
    t.string "offer_amt"
    t.string "agreement"
    t.date "cons_sign_date"
    t.string "contract_amt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "course_imp_date"
    t.date "pcourse_imp_date"
    t.bigint "patient_id", null: false
    t.bigint "course_id", null: false
    t.bigint "pcourse_id", null: false
    t.bigint "dentist_id", null: false
    t.boolean "emergency"
    t.index ["course_id"], name: "index_counselings_on_course_id"
    t.index ["dentist_id"], name: "index_counselings_on_dentist_id"
    t.index ["patient_id"], name: "index_counselings_on_patient_id"
    t.index ["pcourse_id"], name: "index_counselings_on_pcourse_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remarks"
    t.string "master_name"
  end

  create_table "dentist_aggregations", force: :cascade do |t|
    t.integer "no_of_reservations"
    t.integer "actual_visit_patients"
    t.integer "insurance_peoples"
    t.integer "emergency_patients"
    t.integer "new_patients"
    t.integer "re_entry_patients"
    t.integer "patients_finished"
    t.integer "no_of_cancellations"
    t.integer "no_notice_cancellations"
    t.integer "score"
    t.integer "own_expense_amount_money"
    t.integer "miscellaneous_income"
    t.integer "own_expense_people"
    t.integer "no_of_people"
    t.integer "actual_examinations"
    t.integer "referral_card"
    t.integer "referral_patients"
    t.integer "people_returning_home"
    t.integer "payment_people"
    t.integer "through_no_of_reservations"
    t.integer "through_rate"
    t.integer "actual_visit_peoples"
    t.integer "introduction_card"
    t.integer "introduction_patients"
    t.integer "referral_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "clinic_id", null: false
    t.bigint "dentist_id", null: false
    t.index ["clinic_id"], name: "index_dentist_aggregations_on_clinic_id"
    t.index ["dentist_id"], name: "index_dentist_aggregations_on_dentist_id"
  end

  create_table "dh_aggregations", force: :cascade do |t|
    t.integer "no_of_reservations", default: 0
    t.integer "people_maintenance", default: 0
    t.integer "people_treatment", default: 0
    t.integer "people_own_expense", default: 0
    t.integer "oral_count", default: 0
    t.integer "out_of_the_decline", default: 0
    t.integer "cancellation_tel", default: 0
    t.integer "cancellation_without", default: 0
    t.integer "insurance_maintenance", default: 0
    t.integer "insurance_treatment", default: 0
    t.integer "own_income", default: 0
    t.integer "miscc_income", default: 0
    t.integer "no_of_people", default: 0
    t.integer "appt_confm_people", default: 0
    t.integer "interval_1m_people", default: 0
    t.integer "interval_1m_tel", default: 0
    t.integer "interval_1m_without", default: 0
    t.integer "interval_2m_people", default: 0
    t.integer "interval_2m_tel", default: 0
    t.integer "interval_2m_without", default: 0
    t.integer "interval_3m_people", default: 0
    t.integer "interval_3m_tel", default: 0
    t.integer "interval_3m_without", default: 0
    t.integer "interval_4m_people", default: 0
    t.integer "interval_4m_tel", default: 0
    t.integer "interval_4m_without", default: 0
    t.integer "interval_6m_people", default: 0
    t.integer "interval_6m_tel", default: 0
    t.integer "interval_6m_without", default: 0
    t.integer "spt2", default: 0
    t.integer "spt1", default: 0
    t.integer "g_p_heavy_defense", default: 0
    t.integer "no_of_referrals", default: 0
    t.integer "note", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dentist_hygienist_id", null: false
    t.integer "oral_func", default: 0
    t.integer "med_prac_rev", default: 0
    t.integer "act_med_exam_days", default: 0
    t.integer "one_day_no_reservation", default: 0
    t.bigint "clinic_id", null: false
    t.index ["clinic_id"], name: "index_dh_aggregations_on_clinic_id"
    t.index ["dentist_hygienist_id"], name: "index_dh_aggregations_on_dentist_hygienist_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multiple_visit_routes", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_multiple_visit_routes_on_patient_id"
  end

  create_table "occupation_masters", force: :cascade do |t|
    t.string "job_code"
    t.string "job_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remarks"
    t.string "master_name"
  end

  create_table "oral_types", force: :cascade do |t|
    t.string "name"
    t.bigint "counseling_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "exp_date"
    t.date "imp_date"
    t.index ["counseling_id"], name: "index_oral_types_on_counseling_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.bigint "dentist_hygienist_id", null: false
    t.bigint "dentist_id", null: false
    t.bigint "treatment_coordinator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "appointment", default: [], array: true
    t.integer "patient_number"
    t.string "patient_visit_route"
    t.string "keyword"
    t.boolean "panorama"
    t.boolean "caries_check"
    t.string "course"
    t.string "p_course"
    t.text "note"
    t.bigint "clinic_id", null: false
    t.date "last_visit_date"
    t.string "keyword_detail"
    t.string "unknown_course"
    t.index ["clinic_id"], name: "index_patients_on_clinic_id"
    t.index ["dentist_hygienist_id"], name: "index_patients_on_dentist_hygienist_id"
    t.index ["dentist_id"], name: "index_patients_on_dentist_id"
    t.index ["treatment_coordinator_id"], name: "index_patients_on_treatment_coordinator_id"
  end

  create_table "pcourses", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remarks"
    t.string "master_name"
  end

  create_table "prosthodontic_masters", force: :cascade do |t|
    t.string "prosthodontic_code"
    t.string "prosthodontic_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remarks"
    t.string "master_name"
  end

  create_table "sites", force: :cascade do |t|
    t.string "site_name"
    t.float "site_offer_amount"
    t.string "site_agreement"
    t.date "site_consent_signing_date"
    t.float "site_contract_amount"
    t.bigint "counseling_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counseling_id"], name: "index_sites_on_counseling_id"
  end

  create_table "staff_infos", force: :cascade do |t|
    t.string "staff_code"
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.string "job_type"
    t.string "occupation"
    t.string "usage_classification"
    t.datetime "hire_date"
    t.datetime "date_of_leaving_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.bigint "clinic_id", null: false
    t.string "type"
    t.index ["clinic_id"], name: "index_staff_infos_on_clinic_id"
  end

  create_table "super_admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_super_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_super_admins_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "role"
    t.string "usage_classification"
    t.string "first_name"
    t.string "last_name"
    t.string "kana_first_name"
    t.string "kana_last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "version_controls", force: :cascade do |t|
    t.string "title"
    t.date "date_field"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_version_controls_on_user_id"
  end

  create_table "visit_route_masters", force: :cascade do |t|
    t.string "visit_route_code"
    t.string "visit_route_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remarks"
    t.string "master_name"
  end

  create_table "visit_routes", force: :cascade do |t|
    t.date "first_visit"
    t.date "second"
    t.date "treatment_plan_date"
    t.date "implant_correction"
    t.boolean "self_pay_contract"
    t.date "maintenance"
    t.boolean "treatment_plan"
    t.boolean "suspension"
    t.date "suspended_date"
    t.boolean "confirmation_end"
    t.date "end_date"
    t.boolean "maintenance_visit"
    t.date "maintenance_visit_date"
    t.boolean "contact_TEL"
    t.string "suspension_contact_TEL"
    t.boolean "contact_postcard"
    t.string "suspended_contact_postcard"
    t.string "visit_after_interruption"
    t.boolean "p_heavy_defense_target"
    t.date "p_heavy_defense_calculation_date"
    t.boolean "inspection_4mm"
    t.boolean "p_second"
    t.boolean "inspection_3"
    t.boolean "fop"
    t.boolean "whitening"
    t.boolean "medical_tube"
    t.string "mt_tooth_number"
    t.boolean "malocclusion"
    t.text "note"
    t.string "prosthodontics"
    t.date "next_reservation_date"
    t.boolean "thank_you_note"
    t.string "thank_you_note_patient_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "multiple_visit_route_id", null: false
    t.string "introducer_name"
    t.string "charge_job_type"
    t.string "person_in_charge"
    t.boolean "p_heavy_defense_calculation"
    t.index ["multiple_visit_route_id"], name: "index_visit_routes_on_multiple_visit_route_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clinic_ips", "clinics"
  add_foreign_key "clinics", "users"
  add_foreign_key "counselings", "courses"
  add_foreign_key "counselings", "patients"
  add_foreign_key "counselings", "pcourses"
  add_foreign_key "dentist_aggregations", "clinics"
  add_foreign_key "dh_aggregations", "clinics"
  add_foreign_key "multiple_visit_routes", "patients"
  add_foreign_key "oral_types", "counselings"
  add_foreign_key "patients", "clinics"
  add_foreign_key "sites", "counselings"
  add_foreign_key "staff_infos", "clinics"
  add_foreign_key "version_controls", "users"
  add_foreign_key "visit_routes", "multiple_visit_routes"
end

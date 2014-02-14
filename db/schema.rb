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

ActiveRecord::Schema.define(version: 20140214102755) do

  create_table "branches", force: true do |t|
    t.string   "name"
    t.integer  "start_point"
    t.integer  "end_point"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "city"
  end

  create_table "custom_field_values", force: true do |t|
    t.integer  "user_id"
    t.integer  "custom_field_id"
    t.integer  "invoice_id"
    t.string   "field_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lr_entry_id"
  end

  create_table "custom_fields", force: true do |t|
    t.string   "label"
    t.string   "field_type"
    t.string   "values"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.string   "name"
    t.string   "towards"
    t.float    "amount"
    t.text     "comment"
    t.date     "exp_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indian_cities", force: true do |t|
    t.string   "city_name"
    t.string   "city_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "pin_code"
  end

  create_table "invoices", force: true do |t|
    t.string   "bilty_no"
    t.date     "bilty_date"
    t.string   "to_location"
    t.string   "from_location"
    t.integer  "no_of_pieces",      default: 0
    t.float    "actual_weight",     default: 0.0
    t.float    "volumetric_weight", default: 0.0
    t.float    "service_tax",       default: 0.0
    t.float    "fsc",               default: 0.0
    t.boolean  "insurance",         default: false
    t.float    "ins_price",         default: 0.0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "gross_price",       default: 0.0
    t.float    "net_payble",        default: 0.0
  end

  create_table "lorry_challans", force: true do |t|
    t.string   "branch_name"
    t.string   "challan_no"
    t.string   "challan_date"
    t.string   "truck_no"
    t.string   "owner_name"
    t.string   "driver_name"
    t.string   "license_no"
    t.string   "engaged_thr"
    t.string   "truck_type"
    t.string   "from_station"
    t.string   "to_station"
    t.float    "total_paid",    default: 0.0
    t.float    "total_bil",     default: 0.0
    t.float    "less_packet",   default: 0.0
    t.float    "less_per_pkt",  default: 0.0
    t.float    "total_less_wt", default: 0.0
    t.float    "total_to_pay",  default: 0.0
    t.float    "total_weight",  default: 0.0
    t.float    "total_pakages", default: 0.0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lr_entries", force: true do |t|
    t.string   "branch_name"
    t.integer  "lr_no"
    t.date     "lr_date"
    t.string   "to_station"
    t.string   "from_station"
    t.string   "consignor"
    t.string   "consignee"
    t.string   "consignor_address"
    t.string   "consignee_address"
    t.string   "lr_type"
    t.string   "bill_party"
    t.string   "packages"
    t.string   "description"
    t.string   "method_of_pkg"
    t.float    "actual_weight",     default: 0.0
    t.float    "total_pakages",     default: 0.0
    t.float    "total_actual_wt",   default: 0.0
    t.float    "total_charge_wt",   default: 0.0
    t.string   "tax_by"
    t.float    "tax",               default: 0.0
    t.float    "freight",           default: 0.0
    t.string   "truck_type"
    t.string   "rate_type"
    t.string   "exp1_first_name"
    t.string   "exp1_middle_name"
    t.string   "exp1_last_name"
    t.string   "exp2_first_name"
    t.string   "exp2_middle_name"
    t.string   "exp2_last_name"
    t.string   "exp3_first_name"
    t.string   "exp3_middle_name"
    t.string   "exp3_last_name"
    t.string   "exp4_first_name"
    t.string   "exp4_middle_name"
    t.string   "exp4_last_name"
    t.string   "exp5_first_name"
    t.string   "exp5_middle_name"
    t.string   "exp5_last_name"
    t.string   "exp6_first_name"
    t.string   "exp6_middle_name"
    t.string   "exp6_last_name"
    t.string   "exp7_first_name"
    t.string   "exp7_middle_name"
    t.string   "exp7_last_name"
    t.string   "priv_mark"
    t.string   "delivery_address"
    t.string   "challan_no"
    t.date     "challan_date"
    t.string   "cr_challana"
    t.date     "cr_chal_date"
    t.float    "round_off",         default: 0.0
    t.float    "gross_amt",         default: 0.0
    t.float    "service_tax",       default: 0.0
    t.float    "ecess",             default: 0.0
    t.float    "hecess",            default: 0.0
    t.float    "round_off2",        default: 0.0
    t.float    "net_amount",        default: 0.0
    t.float    "value",             default: 0.0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "invoice_date"
    t.string   "payment_status",    default: "Pending"
    t.string   "user_name"
    t.string   "pod_file_name"
    t.string   "pod_content_type"
    t.integer  "pod_file_size"
    t.datetime "pod_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "business_name"
    t.string   "location"
    t.string   "phone"
    t.string   "contact_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role_type"
    t.integer  "admin_id"
    t.string   "access_types"
    t.boolean  "active",                 default: false
    t.string   "pod_file_name"
    t.string   "pod_content_type"
    t.integer  "pod_file_size"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

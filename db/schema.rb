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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131007102355) do

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "builders", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "phone"
    t.string   "country"
    t.text     "address"
    t.string   "city"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "company_url"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "approved"
  end

  add_index "builders", ["confirmation_token"], :name => "index_builders_on_confirmation_token", :unique => true
  add_index "builders", ["email"], :name => "index_builders_on_email", :unique => true
  add_index "builders", ["reset_password_token"], :name => "index_builders_on_reset_password_token", :unique => true

  create_table "contacts", :force => true do |t|
    t.integer  "builder_id"
    t.integer  "property_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "question"
    t.string   "option"
    t.datetime "appointment_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "builder_id"
    t.integer  "property_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "properties", :force => true do |t|
    t.integer  "builder_id"
    t.string   "property_name"
    t.string   "property_listing"
    t.string   "property_type"
    t.integer  "no_of_flats"
    t.integer  "no_of_floors"
    t.integer  "no_of_houses"
    t.integer  "no_of_plots"
    t.string   "state"
    t.string   "city"
    t.text     "address"
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "total_area"
    t.string   "saleable_area"
    t.string   "sale_price"
    t.integer  "parking"
    t.integer  "swimming"
    t.integer  "playground"
    t.integer  "party_hall"
    t.string   "property_status"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "upcoming_date"
    t.text     "description"
    t.boolean  "gmaps"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "published",        :default => false
    t.integer  "search_view",      :default => 0
    t.integer  "full_view",        :default => 0
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "location"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

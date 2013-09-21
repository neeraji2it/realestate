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

ActiveRecord::Schema.define(:version => 20130921063413) do

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
  end

  add_index "builders", ["confirmation_token"], :name => "index_builders_on_confirmation_token", :unique => true
  add_index "builders", ["email"], :name => "index_builders_on_email", :unique => true
  add_index "builders", ["reset_password_token"], :name => "index_builders_on_reset_password_token", :unique => true

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
    t.string   "lat"
    t.string   "lng"
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
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

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
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

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

ActiveRecord::Schema.define(version: 20151229204217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_events", id: :bigserial, force: :cascade do |t|
    t.integer  "app_id",     limit: 8
    t.integer  "shop_id",    limit: 8
    t.string   "name"
    t.string   "domain"
    t.string   "email"
    t.string   "kind"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "app_links", id: :bigserial, force: :cascade do |t|
    t.integer  "app_id",     limit: 8
    t.string   "location"
    t.string   "link_text"
    t.string   "link_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "apps", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "large_icon"
    t.string   "small_icon"
    t.boolean  "embedded"
    t.string   "application_url"
    t.string   "preferences_url"
    t.string   "support_url"
    t.string   "redirection_url"
    t.string   "proxy_path_prefix"
    t.string   "proxy_sub_path"
    t.string   "proxy_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "shops", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "domain"
    t.string   "province"
    t.string   "province_code",                     limit: 2
    t.string   "country"
    t.string   "country_code",                      limit: 2
    t.string   "country_name"
    t.string   "address1"
    t.string   "zip"
    t.string   "city"
    t.string   "source"
    t.string   "phone"
    t.string   "customer_email"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "primary_location_id",               limit: 8
    t.string   "primary_locale"
    t.string   "currency"
    t.string   "timezone"
    t.string   "iana_timezone"
    t.string   "shop_owner"
    t.string   "money_format"
    t.string   "money_with_currency_format"
    t.boolean  "taxes_included"
    t.boolean  "tax_shipping"
    t.boolean  "county_taxes"
    t.string   "plan_display_name"
    t.string   "plan_name"
    t.boolean  "has_discounts"
    t.boolean  "has_gift_cards"
    t.string   "myshopify_domain"
    t.string   "google_apps_domain"
    t.boolean  "google_apps_login_enabled"
    t.string   "money_in_emails_format"
    t.boolean  "eligible_for_payments"
    t.boolean  "requires_extra_payments_agreement",           default: false
    t.boolean  "password_enabled",                            default: true
    t.boolean  "has_storefront",                              default: true
    t.boolean  "setup_required",                              default: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "shops", ["id"], name: "index_shops_on_id", using: :btree

end

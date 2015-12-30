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

ActiveRecord::Schema.define(version: 20151230193659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", id: :bigserial, force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "province_code"
    t.string   "country"
    t.string   "zip"
    t.string   "phone"
    t.string   "province"
    t.string   "company"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "name"
    t.string   "country_code"
    t.string   "country_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

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

  create_table "client_details", id: :bigserial, force: :cascade do |t|
    t.string   "browser_ip"
    t.string   "accept_language"
    t.string   "user_agent"
    t.text     "session_hash"
    t.string   "browser_width"
    t.string   "browser_height"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "fulfillment_line_items", id: :bigserial, force: :cascade do |t|
    t.integer "fulfillment_id", limit: 8
    t.integer "line_item_id",   limit: 8
  end

  add_index "fulfillment_line_items", ["fulfillment_id", "line_item_id"], name: "index_fulfillment_line_items_on_fulfillment_id_and_line_item_id", using: :btree

  create_table "fulfillments", id: :bigserial, force: :cascade do |t|
    t.integer  "order_id",         limit: 8
    t.string   "status"
    t.string   "service"
    t.string   "tracking_company"
    t.string   "tracking_number"
    t.text     "tracking_url"
    t.text     "tracking_numbers"
    t.text     "tracking_urls"
    t.integer  "receipt_id",       limit: 8
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "line_item_properties", force: :cascade do |t|
    t.integer "line_item_id", limit: 8
    t.string  "name"
    t.text    "value"
  end

  add_index "line_item_properties", ["line_item_id"], name: "index_line_item_properties_on_line_item_id", using: :btree
  add_index "line_item_properties", ["name"], name: "index_line_item_properties_on_name", using: :btree

  create_table "line_item_tax_lines", id: :bigserial, force: :cascade do |t|
    t.integer "line_item_id", limit: 8
    t.integer "price_cents"
    t.integer "rate_cents"
    t.string  "title"
  end

  add_index "line_item_tax_lines", ["line_item_id"], name: "index_line_item_tax_lines_on_line_item_id", using: :btree

  create_table "line_items", id: :bigserial, force: :cascade do |t|
    t.integer  "order_id",                     limit: 8
    t.integer  "variant_id",                   limit: 8
    t.integer  "product_id",                   limit: 8
    t.string   "vendor"
    t.integer  "quantity"
    t.integer  "price_cents"
    t.boolean  "fulfillable"
    t.string   "fulfillment_service"
    t.integer  "fulfillable_quantity"
    t.string   "fulfillment_status"
    t.boolean  "requires_shipping"
    t.boolean  "taxable"
    t.boolean  "gift_card"
    t.string   "title"
    t.integer  "grams"
    t.string   "sku"
    t.string   "variant_title"
    t.string   "name"
    t.string   "variant_inventory_management"
    t.string   "product_exists"
    t.integer  "total_discount_cents"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "note_attributes", id: :bigserial, force: :cascade do |t|
    t.integer "order_id", limit: 8
    t.string  "name"
    t.text    "value"
  end

  add_index "note_attributes", ["name"], name: "index_note_attributes_on_name", using: :btree
  add_index "note_attributes", ["order_id"], name: "index_note_attributes_on_order_id", using: :btree

  create_table "orders", id: :bigserial, force: :cascade do |t|
    t.integer  "shop_id",                      limit: 8
    t.integer  "total_price_cents"
    t.string   "email"
    t.datetime "closed_at"
    t.integer  "number"
    t.text     "note"
    t.string   "token"
    t.string   "gateway"
    t.boolean  "test"
    t.integer  "subtotal_price_cents"
    t.integer  "total_weight"
    t.integer  "total_tax_cents"
    t.boolean  "taxes_included"
    t.string   "currency"
    t.string   "financial_status"
    t.string   "confirmed"
    t.integer  "total_discounts_cents"
    t.integer  "total_line_items_price_cents"
    t.string   "cart_token"
    t.boolean  "buyer_accepts_marketing"
    t.string   "name"
    t.text     "referring_site"
    t.text     "landing_site"
    t.datetime "cancelled_at"
    t.string   "cancel_reason"
    t.integer  "total_price_usd_cents"
    t.string   "checkout_token"
    t.string   "reference"
    t.integer  "user_id",                      limit: 8
    t.integer  "location_id",                  limit: 8
    t.string   "source_identifier"
    t.text     "source_url"
    t.datetime "processed_at"
    t.integer  "device_id",                    limit: 8
    t.string   "browser_ip"
    t.text     "landing_site_ref"
    t.integer  "order_number",                 limit: 8
    t.string   "processing_method"
    t.integer  "checkout_id",                  limit: 8
    t.string   "source_name"
    t.string   "fulfillment_status"
    t.text     "tags"
    t.string   "contact_email"
    t.text     "payment_gateways"
    t.integer  "shipping_address_id",          limit: 8
    t.integer  "billing_address_id",           limit: 8
    t.integer  "client_details_id",            limit: 8
    t.integer  "payment_details_id",           limit: 8
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "payment_details", id: :bigserial, force: :cascade do |t|
    t.string   "credit_card_bin"
    t.string   "avs_result_code"
    t.string   "cvv_result_code"
    t.string   "credit_card_number"
    t.string   "credit_card_company"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "receipts", id: :bigserial, force: :cascade do |t|
    t.boolean "testcase"
    t.string  "authorization"
  end

  create_table "refund_line_items", id: :bigserial, force: :cascade do |t|
    t.integer "refund_id",    limit: 8
    t.integer "line_item_id", limit: 8
    t.integer "quantity"
  end

  add_index "refund_line_items", ["refund_id", "line_item_id"], name: "index_refund_line_items_on_refund_id_and_line_item_id", using: :btree

  create_table "refund_transactions", id: :bigserial, force: :cascade do |t|
    t.integer "refund_id",      limit: 8
    t.integer "transaction_id", limit: 8
  end

  add_index "refund_transactions", ["refund_id", "transaction_id"], name: "index_refund_transactions_on_refund_id_and_transaction_id", using: :btree

  create_table "refunds", id: :bigserial, force: :cascade do |t|
    t.integer  "order_id",   limit: 8
    t.text     "note"
    t.boolean  "restock"
    t.integer  "user_id",    limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "shipping_line_tax_lines", id: :bigserial, force: :cascade do |t|
    t.integer "shipping_line_id", limit: 8
    t.integer "price_cents"
    t.integer "rate_cents"
    t.string  "title"
  end

  add_index "shipping_line_tax_lines", ["shipping_line_id"], name: "index_shipping_line_tax_lines_on_shipping_line_id", using: :btree

  create_table "shipping_lines", id: :bigserial, force: :cascade do |t|
    t.integer  "order_id",    limit: 8
    t.string   "title"
    t.integer  "price_cents"
    t.string   "code"
    t.string   "source"
    t.string   "phone"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
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

  create_table "transactions", id: :bigserial, force: :cascade do |t|
    t.integer  "order_id",           limit: 8
    t.integer  "amount_cents"
    t.string   "kind"
    t.string   "gateway"
    t.string   "status"
    t.text     "message"
    t.boolean  "test"
    t.string   "authorization"
    t.string   "currency"
    t.integer  "location_id",        limit: 8
    t.integer  "user_id",            limit: 8
    t.integer  "parent_id",          limit: 8
    t.integer  "device_id",          limit: 8
    t.integer  "receipt_id",         limit: 8
    t.integer  "payment_details_id", limit: 8
    t.string   "error_code"
    t.string   "source_name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "transactions", ["device_id"], name: "index_transactions_on_device_id", using: :btree
  add_index "transactions", ["location_id"], name: "index_transactions_on_location_id", using: :btree
  add_index "transactions", ["order_id"], name: "index_transactions_on_order_id", using: :btree
  add_index "transactions", ["parent_id"], name: "index_transactions_on_parent_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

end

class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :email
      t.string :domain
      t.string :province
      t.string :province_code, limit: 2
      t.string :country
      t.string :country_code, limit: 2
      t.string :country_name
      t.string :address1
      t.string :zip
      t.string :city
      t.string :source
      t.string :phone
      t.string :customer_email
      t.string :latitude
      t.string :longitude
      t.integer :primary_location_id, limit: 8
      t.string :primary_locale
      t.string :currency
      t.string :timezone
      t.string :iana_timezone
      t.string :shop_owner
      t.string :money_format
      t.string :money_with_currency_format
      t.boolean :taxes_included
      t.boolean :tax_shipping
      t.boolean :county_taxes
      t.string :plan_display_name
      t.string :plan_name
      t.boolean :has_discounts
      t.boolean :has_gift_cards
      t.string :myshopify_domain
      t.string :google_apps_domain
      t.boolean :google_apps_login_enabled
      t.string :money_in_emails_format
      t.boolean :eligible_for_payments, defualt: true
      t.boolean :requires_extra_payments_agreement, default: false
      t.boolean :password_enabled, default: true
      t.boolean :has_storefront, default: true
      t.boolean :setup_required, default: false

      t.timestamps null: false
    end

    change_column :shops, :id, :integer, limit: 8

    add_index :shops, :id
  end
end

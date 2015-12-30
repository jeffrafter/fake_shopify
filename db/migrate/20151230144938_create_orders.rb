class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer  :shop_id, limit: 8
      t.integer  :total_price_cents
      t.string   :email
      t.datetime :closed_at
      t.integer  :number
      t.text     :note
      t.string   :token
      t.string   :gateway
      t.boolean  :test
      t.integer  :subtotal_price_cents
      t.integer  :total_weight
      t.integer  :total_tax_cents
      t.boolean  :taxes_included
      t.string   :currency
      t.string   :financial_status
      t.string   :confirmed
      t.integer  :total_discounts_cents
      t.integer  :total_line_items_price_cents
      t.string   :cart_token
      t.boolean  :buyer_accepts_marketing
      t.string   :name
      t.text     :referring_site
      t.text     :landing_site
      t.datetime :cancelled_at
      t.string   :cancel_reason
      t.integer  :total_price_usd_cents
      t.string   :checkout_token
      t.string   :reference
      t.integer  :user_id, limit: 8
      t.integer  :location_id, limit: 8
      t.string   :source_identifier
      t.text     :source_url
      t.datetime :processed_at
      t.integer  :device_id, limit: 8
      t.string   :browser_ip
      t.text     :landing_site_ref
      t.integer  :order_number, limit: 8
      t.string   :processing_method
      t.integer  :checkout_id, limit: 8
      t.string   :source_name
      t.string   :fulfillment_status
      t.text     :tags
      t.string   :contact_email
      t.text     :payment_gateways
      t.integer  :shipping_address_id, limit: 8
      t.integer  :billing_address_id, limit: 8
      t.integer  :client_details_id, limit: 8
      t.integer  :payment_details_id, limit: 8

      t.timestamps null: false
    end

    change_column :orders, :id, :integer, limit: 8
  end
end

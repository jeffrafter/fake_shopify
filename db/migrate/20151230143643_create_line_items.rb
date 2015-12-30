class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer  :order_id, limit: 8
      t.integer  :variant_id, limit: 8
      t.integer  :product_id, limit: 8
      t.string   :vendor
      t.integer  :quantity
      t.integer  :price_cents
      t.boolean  :fulfillable
      t.string   :fulfillment_service
      t.integer  :fulfillable_quantity
      t.string   :fulfillment_status
      t.boolean  :requires_shipping
      t.boolean  :taxable
      t.boolean  :gift_card
      t.string   :title
      t.integer  :grams
      t.string   :sku
      t.string   :variant_title
      t.string   :name
      t.string   :variant_inventory_management
      t.string   :product_exists
      t.integer  :total_discount_cents

      t.timestamps null: false
    end

    change_column :line_items, :id, :integer, limit: 8
  end
end

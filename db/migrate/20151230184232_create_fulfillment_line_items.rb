class CreateFulfillmentLineItems < ActiveRecord::Migration
  def change
    create_table :fulfillment_line_items do |t|
      t.integer :fulfillment_id, limit: 8
      t.integer :line_item_id, limit: 8
    end

    change_column :fulfillment_line_items, :id, :integer, limit: 8

    add_index :fulfillment_line_items, [:fulfillment_id, :line_item_id]
  end
end

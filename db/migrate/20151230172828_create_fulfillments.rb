class CreateFulfillments < ActiveRecord::Migration
  def change
    create_table :fulfillments do |t|
      t.integer :order_id, limit: 8
      t.string :status
      t.string :service
      t.string :tracking_company
      t.string :tracking_number
      t.text :tracking_url
      t.text :tracking_numbers
      t.text :tracking_urls
      t.integer :receipt_id, limit: 8

      t.timestamps null: false
    end

    change_column :fulfillments, :id, :integer, limit: 8
  end
end

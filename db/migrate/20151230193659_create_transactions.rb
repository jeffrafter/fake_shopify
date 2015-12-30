class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :order_id, limit: 8
      t.integer :amount_cents
      t.string :kind
      t.string :gateway
      t.string :status
      t.text :message
      t.boolean :test
      t.string :authorization
      t.string :currency
      t.integer :location_id, limit: 8
      t.integer :user_id, limit: 8
      t.integer :parent_id, limit: 8
      t.integer :device_id, limit: 8
      t.integer :receipt_id, limit: 8
      t.integer :payment_details_id, limit: 8
      t.string :error_code
      t.string :source_name

      t.timestamps null: false
    end

    change_column :transactions, :id, :integer, limit: 8

    add_index :transactions, [:order_id]
    add_index :transactions, [:parent_id]
    add_index :transactions, [:user_id]
    add_index :transactions, [:location_id]
    add_index :transactions, [:device_id]
  end
end

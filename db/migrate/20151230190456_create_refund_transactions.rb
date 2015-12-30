class CreateRefundTransactions < ActiveRecord::Migration
  def change
    create_table :refund_transactions do |t|
      t.integer :refund_id, limit: 8
      t.integer :transaction_id, limit: 8
    end

    change_column :refund_transactions, :id, :integer, limit: 8

    add_index :refund_transactions, [:refund_id, :transaction_id]
  end
end

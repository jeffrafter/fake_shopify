class CreateRefundLineItems < ActiveRecord::Migration
  def change
    create_table :refund_line_items do |t|
      t.integer :refund_id, limit: 8
      t.integer :line_item_id, limit: 8
      t.integer :quantity
    end

    change_column :refund_line_items, :id, :integer, limit: 8

    add_index :refund_line_items, [:refund_id, :line_item_id]
  end
end



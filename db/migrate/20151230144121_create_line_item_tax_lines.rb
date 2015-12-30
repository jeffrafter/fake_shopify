class CreateLineItemTaxLines < ActiveRecord::Migration
  def change
    create_table :line_item_tax_lines do |t|
      t.integer :line_item_id, limit: 8
      t.integer :price_cents
      t.integer :rate_cents
      t.string :title
    end

    change_column :line_item_tax_lines, :id, :integer, limit: 8

    add_index :line_item_tax_lines, :line_item_id
  end
end

class CreateShippingLineTaxLines < ActiveRecord::Migration
  def change
    create_table :shipping_line_tax_lines do |t|
      t.integer :shipping_line_id, limit: 8
      t.integer :price_cents
      t.integer :rate_cents
      t.string :title
    end

    change_column :shipping_line_tax_lines, :id, :integer, limit: 8

    add_index :shipping_line_tax_lines, :shipping_line_id
  end
end

class CreateLineItemProperties < ActiveRecord::Migration
  def change
    create_table :line_item_properties do |t|
      t.integer :line_item_id, limit: 8
      t.string :name
      t.text :value
    end

    change_column :line_item_tax_lines, :id, :integer, limit: 8

    add_index :line_item_properties, :line_item_id
    add_index :line_item_properties, :name
  end
end

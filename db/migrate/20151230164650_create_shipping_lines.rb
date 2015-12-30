class CreateShippingLines < ActiveRecord::Migration
  def change
    create_table :shipping_lines do |t|
      t.integer :order_id, limit: 8
      t.string :title
      t.integer :price_cents
      t.string :code
      t.string :source
      t.string :phone

      t.timestamps null: false
    end

    change_column :shipping_lines, :id, :integer, limit: 8
  end
end

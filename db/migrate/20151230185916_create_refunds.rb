class CreateRefunds < ActiveRecord::Migration
  def change
    create_table :refunds do |t|
      t.integer :order_id, limit: 8
      t.text :note
      t.boolean :restock
      t.integer :user_id, limit: 8

      t.timestamps null: false
    end

    change_column :refunds, :id, :integer, limit: 8
  end
end

class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.boolean :testcase
      t.string :authorization
    end

    change_column :receipts, :id, :integer, limit: 8
  end
end

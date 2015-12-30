class CreateNoteAttributes < ActiveRecord::Migration
  def change
    create_table :note_attributes do |t|
      t.integer :order_id, limit: 8
      t.string :name
      t.text :value
    end

    change_column :note_attributes, :id, :integer, limit: 8

    add_index :note_attributes, [:order_id]
    add_index :note_attributes, [:name]
  end
end

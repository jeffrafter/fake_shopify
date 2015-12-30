class CreateClientDetails < ActiveRecord::Migration
  def change
    create_table :client_details do |t|
      t.string :browser_ip
      t.string :accept_language
      t.string :user_agent
      t.text :session_hash
      t.string :browser_width
      t.string :browser_height

      t.timestamps null: false
    end

    change_column :client_details, :id, :integer, limit: 8
  end
end

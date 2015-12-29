class CreateAppLinks < ActiveRecord::Migration
  def change
    create_table :app_links do |t|
      t.integer :app_id, limit: 8
      t.string :location
      t.string :link_text
      t.string :link_url

      t.timestamps null: false
    end

    change_column :app_links, :id, :integer, limit: 8
  end
end

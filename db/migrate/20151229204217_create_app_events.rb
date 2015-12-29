class CreateAppEvents < ActiveRecord::Migration
  def change
    create_table :app_events do |t|
      t.integer :app_id, limit: 8
      t.integer :shop_id, limit: 8
      t.string :name
      t.string :domain
      t.string :email
      t.string :kind

      t.timestamps null: false
    end

    change_column :app_events, :id, :integer, limit: 8
  end
end

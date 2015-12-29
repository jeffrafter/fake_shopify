class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :large_icon
      t.string :small_icon
      t.boolean :embedded
      t.string :application_url
      t.string :preferences_url
      t.string :support_url
      t.string :redirection_url
      t.string :proxy_path_prefix
      t.string :proxy_sub_path
      t.string :proxy_url

      t.timestamps null: false
    end

    change_column :apps, :id, :integer, limit: 8
  end
end

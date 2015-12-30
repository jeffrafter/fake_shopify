class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :province_code
      t.string :country
      t.string :zip
      t.string :phone
      t.string :province
      t.string :company
      t.string :latitude
      t.string :longitude
      t.string :name
      t.string :country_code
      t.string :country_name

      t.timestamps null: false
    end

    change_column :addresses, :id, :integer, limit: 8
  end
end




class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|
      t.string :credit_card_bin
      t.string :avs_result_code
      t.string :cvv_result_code
      t.string :credit_card_number
      t.string :credit_card_company

      t.timestamps null: false
    end

    change_column :payment_details, :id, :integer, limit: 8
  end
end

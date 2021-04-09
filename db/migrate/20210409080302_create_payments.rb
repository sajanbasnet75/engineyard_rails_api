class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :booking_id, index: true
      t.float :total_amt
      t.float :deposit_amt
      t.string :card_number
      t.date :card_exp_date
      t.string :invoice_id
      t.integer :type
      t.integer :pay_status
      t.string :billing_name
      t.string :billing_street
      t.string :billing_country
      t.string :billing_state
      t.string :billing_city

      t.timestamps
    end
  end
end

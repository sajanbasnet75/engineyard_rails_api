class ChangeColumnInPayment < ActiveRecord::Migration[6.1]
  def change
    change_column :payments, :card_exp_date, :string
  end
end

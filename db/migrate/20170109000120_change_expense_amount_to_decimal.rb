class ChangeExpenseAmountToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :expenses, :amount, :decimal, precision: 12, scale: 2
  end
end

class ChangeBudgetAnnualAmountToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :budgets, :annual_amount, :decimal, precision: 12, scale: 2
  end
end

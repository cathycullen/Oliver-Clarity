class ChangeFeesRateToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :fees, :rate, :decimal, precision: 12, scale: 2
  end
end

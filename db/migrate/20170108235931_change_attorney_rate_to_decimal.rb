class ChangeAttorneyRateToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :attorneys, :rate, :decimal, precision: 7, scale: 2
  end
end

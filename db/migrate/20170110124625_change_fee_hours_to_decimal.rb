class ChangeFeeHoursToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :fees, :hours, :decimal, precision: 5, scale: 2
  end
end

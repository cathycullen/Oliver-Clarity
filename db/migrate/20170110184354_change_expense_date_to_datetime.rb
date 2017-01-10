class ChangeExpenseDateToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :expenses, :date, :datetime
  end
end

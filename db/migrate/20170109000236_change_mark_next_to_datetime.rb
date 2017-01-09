class ChangeMarkNextToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :marks, :next, :datetime
  end
end

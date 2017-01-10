class ChangeMarkDeadlineToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :marks, :deadline, :datetime
  end
end

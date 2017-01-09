class ChangeFeesHoursToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :fees, :hours, :integer
  end
end

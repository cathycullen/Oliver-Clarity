class ChangeCorpNextToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :corps, :next, :datetime
  end
end

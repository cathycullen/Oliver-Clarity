class ChangeCorpIncorporationToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :corps, :incorporation, :datetime
  end
end

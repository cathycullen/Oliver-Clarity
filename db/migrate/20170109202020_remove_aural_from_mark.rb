class RemoveAuralFromMark < ActiveRecord::Migration[5.0]
  def up
    remove_column :marks, :aural
  end

  def down
    add_column :marks, :aural, :string
  end
end

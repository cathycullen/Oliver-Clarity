class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.string :contact
      t.string :email
      t.string :owner
      t.string :entity
      t.string :address
      t.string :description
      t.string :colors
      t.string :anywhere
      t.string :commerce
      t.string :products
      t.string :aural
      t.string :serial
      t.string :registration
      t.string :next
      t.string :deadline

      t.timestamps
    end
  end
end

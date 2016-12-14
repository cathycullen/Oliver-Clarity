class CreateCorps < ActiveRecord::Migration[5.0]
  def change
    create_table :corps do |t|
      t.string :contact
      t.string :email
      t.string :entity
      t.string :owners
      t.string :office
      t.string :state
      t.string :company
      t.string :business
      t.string :regagent
      t.string :regoffice
      t.string :incorporation
      t.string :ein
      t.string :next

      t.timestamps
    end
  end
end

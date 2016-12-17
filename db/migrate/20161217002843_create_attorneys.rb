class CreateAttorneys < ActiveRecord::Migration[5.0]
  def change
    create_table :attorneys do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :license
      t.string :states
      t.string :practice

      t.timestamps
    end
  end
end

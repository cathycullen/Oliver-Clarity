class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.string :date
      t.string :rate
      t.string :hours
      t.string :charge

      t.timestamps
    end
  end
end

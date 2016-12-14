class CreateMinutes < ActiveRecord::Migration[5.0]
  def change
    create_table :minutes do |t|
      t.string :name
      t.string :email
      t.string :company
      t.datetime :date
      t.string :kind
      t.string :attendees
      t.string :notice
      t.string :vote
      t.string :resolutions
      t.string :additional

      t.timestamps
    end
  end
end

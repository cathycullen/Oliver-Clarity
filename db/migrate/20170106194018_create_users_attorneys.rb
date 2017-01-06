class CreateUsersAttorneys < ActiveRecord::Migration[5.0]
  def change
    create_table :users_attorneys do |t|
      t.references :user, foreign_key: true
      t.references :attorney, foreign_key: true

      t.timestamps
    end
  end
end

class AddUserToMinutes < ActiveRecord::Migration[5.0]
  def change
    add_reference :minutes, :user, foreign_key: true
  end
end

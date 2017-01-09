class AddUserToCorps < ActiveRecord::Migration[5.0]
  def change
    add_reference :corps, :user, foreign_key: true
  end
end

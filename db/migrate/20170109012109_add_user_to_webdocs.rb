class AddUserToWebdocs < ActiveRecord::Migration[5.0]
  def change
    add_reference :webdocs, :user, foreign_key: true
  end
end

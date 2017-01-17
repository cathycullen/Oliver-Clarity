class AddFieldsToWebdocs < ActiveRecord::Migration[5.0]
  def change
    add_column :webdocs, :filename, :string
    add_column :webdocs, :content_type, :string
    add_column :webdocs, :file_contents, :binary
    remove_column :webdocs, :name
    remove_column :webdocs, :email
    remove_column :webdocs, :owner
    change_column :webdocs, :children, :boolean, default: false
  end
end

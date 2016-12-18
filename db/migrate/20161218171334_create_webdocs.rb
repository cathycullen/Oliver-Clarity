class CreateWebdocs < ActiveRecord::Migration[5.0]
  def change
    create_table :webdocs do |t|
      t.string :name
      t.string :email
      t.string :owner
      t.string :url
      t.string :state
      t.string :children
      t.string :products
      t.string :similar

      t.timestamps
    end
  end
end

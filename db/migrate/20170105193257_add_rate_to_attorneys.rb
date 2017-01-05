class AddRateToAttorneys < ActiveRecord::Migration[5.0]
  def change
    add_column :attorneys, :rate, :string
  end
end

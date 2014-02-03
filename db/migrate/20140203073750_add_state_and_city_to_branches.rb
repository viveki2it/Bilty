class AddStateAndCityToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :state, :string
    add_column :branches, :city, :string
  end
end

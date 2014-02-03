class AddLatitudeLongitudePincodeToIndianCities < ActiveRecord::Migration
  def change
    add_column :indian_cities, :latitude, :string
    add_column :indian_cities, :longitude, :string
    add_column :indian_cities, :pin_code, :string
  end
end

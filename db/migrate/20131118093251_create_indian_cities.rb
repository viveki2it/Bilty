class CreateIndianCities < ActiveRecord::Migration
  def change
    create_table :indian_cities do |t|
      t.string :city_name
      t.string :city_state

      t.timestamps
    end
  end
end

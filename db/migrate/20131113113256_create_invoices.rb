class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :bilty_no
      t.date :bilty_date
      t.string :to_location
      t.string :from_location
      t.integer :no_of_pieces, :default => 0
      t.float :actual_weight, :default => 0
      t.float :volumetric_weight, :default => 0
      t.float :service_tax, :default => 0
      t.float :fsc, :default => 0
      t.boolean :insurance, :default => false 
      t.float :ins_price, :default => 0
      t.integer :user_id
      t.timestamps
    end
  end
end

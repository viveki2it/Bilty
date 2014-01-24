class AddedGrossPriceAndNetPaybleToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :gross_price, :float, :default => 0
    add_column :invoices, :net_payble, :float, :default => 0
  end
end

class AddedInvoiceDateAndPaymentStatusAndUserNameToLrEntries < ActiveRecord::Migration
  def change
    add_column :lr_entries, :invoice_date, :date
    add_column :lr_entries, :payment_status, :string, :default => "Pending"
    add_column :lr_entries, :user_name, :string
  end
end

class CreateCustomFieldValues < ActiveRecord::Migration
  def change
    create_table :custom_field_values do |t|
      t.integer :user_id
      t.integer :custom_field_id
      t.integer :invoice_id
      t.string :field_value
      
      t.timestamps
    end
  end
end

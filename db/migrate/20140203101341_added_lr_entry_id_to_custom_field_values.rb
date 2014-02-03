class AddedLrEntryIdToCustomFieldValues < ActiveRecord::Migration
  def change
    add_column :custom_field_values, :lr_entry_id, :integer
  end
end

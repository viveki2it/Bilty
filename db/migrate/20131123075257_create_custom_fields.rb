class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :label
      t.string :field_type
      t.string :values
      t.integer :user_id
      t.timestamps
    end
  end
end

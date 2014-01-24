class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :towards
      t.float :amount
      t.text :comment
      t.date :exp_date
      t.integer :user_id
      
      t.timestamps
    end
  end
end

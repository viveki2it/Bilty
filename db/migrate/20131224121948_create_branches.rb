class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.integer :start_point
      t.integer :end_point
      t.integer :user_id
      t.timestamps
    end
  end
end

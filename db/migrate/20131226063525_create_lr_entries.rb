class CreateLrEntries < ActiveRecord::Migration
  def change
    create_table :lr_entries do |t|
      t.string :branch_name
      t.integer :lr_no
      t.date :lr_date
      t.string :to_station
      t.string :from_station
      t.string :consignor
      t.string :consignee
      t.string :consignor_address
      t.string :consignee_address
      t.string :lr_type
      t.string :bill_party
      t.string :packages
      t.string :description
      t.string :method_of_pkg
      t.float :actual_weight, :default => 0
      t.float :total_pakages, :default => 0
      t.float :total_actual_wt, :default => 0
      t.float :total_charge_wt, :default => 0
      t.string :tax_by
      t.float :tax, :default => 0
      t.float :freight, :default => 0
      t.string :truck_type
      t.string :rate_type
      t.string :exp1_first_name
      t.string :exp1_middle_name
      t.string :exp1_last_name
      t.string :exp2_first_name
      t.string :exp2_middle_name
      t.string :exp2_last_name
      t.string :exp3_first_name
      t.string :exp3_middle_name
      t.string :exp3_last_name
      t.string :exp4_first_name
      t.string :exp4_middle_name
      t.string :exp4_last_name
      t.string :exp5_first_name
      t.string :exp5_middle_name
      t.string :exp5_last_name
      t.string :exp6_first_name
      t.string :exp6_middle_name
      t.string :exp6_last_name
      t.string :exp7_first_name
      t.string :exp7_middle_name
      t.string :exp7_last_name
      t.string :priv_mark
      t.string :delivery_address
      t.string :challan_no
      t.date :challan_date
      t.string :cr_challana
      t.date :cr_chal_date
      t.float :round_off, :default => 0
      t.float :gross_amt, :default => 0
      t.float :service_tax, :default => 0
      t.float :ecess, :default => 0
      t.float :hecess, :default => 0
      t.float :round_off2, :default => 0
      t.float :net_amount, :default => 0
      t.float :value, :default => 0
      t.integer :user_id
      
      t.timestamps
    end
  end
end

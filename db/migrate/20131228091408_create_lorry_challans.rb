class CreateLorryChallans < ActiveRecord::Migration
  def change
    create_table :lorry_challans do |t|
      t.string :branch_name
      t.string :challan_no
      t.string :challan_date
      t.string :truck_no
      t.string :owner_name
      t.string :driver_name
      t.string :license_no
      t.string :engaged_thr
      t.string :truck_type
      t.string :from_station
      t.string :to_station
      t.float :total_paid, :default => 0
      t.float :total_bil, :default => 0
      t.float :less_packet, :default => 0
      t.float :less_per_pkt, :default => 0
      t.float :total_less_wt, :default => 0
      t.float :total_to_pay, :default => 0
      t.float :total_weight, :default => 0
      t.float :total_pakages, :default => 0
      t.integer :user_id
      t.timestamps
    end
  end
end

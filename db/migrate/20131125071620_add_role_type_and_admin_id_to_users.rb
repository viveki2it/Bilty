class AddRoleTypeAndAdminIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_type, :string
    add_column :users, :admin_id, :integer
    add_column :users, :access_types, :string
  end
end

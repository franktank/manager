class CreateRolePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :role_permissions do |t|
      t.references :role
      t.references :permission
      t.timestamps null: false
    end

    add_foreign_key :role_permissions, :roles
    add_foreign_key :role_permissions, :permissions
  end
end

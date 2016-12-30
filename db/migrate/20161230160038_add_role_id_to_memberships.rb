class AddRoleIdToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_reference :memberships, :role, index: true
    add_foreign_key :memberships, :roles
  end
end

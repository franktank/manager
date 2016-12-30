class AddOwnerIdToGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :groups, :owner, references: :users, index: true
    add_foreign_key :groups, :users, column: :owner_id
  end
end

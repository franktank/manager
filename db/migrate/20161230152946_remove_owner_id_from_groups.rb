class RemoveOwnerIdFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column(:groups, :owner_id, :integer)
  end
end

class AddTimestampAndOwnerIdToGroups < ActiveRecord::Migration[5.0]
  def change
    add_timestamps(:groups, null: false)
    add_column(:groups, :owner_id, :integer)
  end
end

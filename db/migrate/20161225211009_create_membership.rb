class CreateMembership < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.references :user
      t.references :group
      t.timestamps null: false
    end

    add_foreign_key :memberships, :users
    add_foreign_key :memberships, :groups
  end
end

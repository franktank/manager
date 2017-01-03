class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :email
      t.references :group
      t.string :token
      t.timestamps null: false
    end
    add_reference :invites, :sender, references: :users, index: true
    add_foreign_key :invites, :users, column: :sender_id

    add_reference :invites, :recipient, references: :users, index: true
    add_foreign_key :invites, :users, column: :recipient_id

    add_foreign_key :invites, :groups
  end
end

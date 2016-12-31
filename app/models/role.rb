class Role < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  validates_presence_of :name
end

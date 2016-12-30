class RolePermission < ApplicationRecord
  belongs_to :role
  belongs_to :permission

  validates_presence_of :role
  validates_presence_of :permission
end

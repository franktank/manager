class Permission < ApplicationRecord
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  validates_presence_of :name
  validates_presence_of :description
end

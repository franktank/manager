class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_one :owner, class_name: "User"

  validates_presence_of :name
end

class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :invites
  belongs_to :owner, class_name: "User", optional: true

  validates_presence_of :name
end

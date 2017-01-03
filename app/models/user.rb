class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :owned_groups, class_name: 'Group', foreign_key: 'owner_id'
  has_many :invitations, class_name: 'Invite', foreign_key: 'recipient_id'
  has_many :sent_invites, class_name: 'Invite', foreign_key: 'sender_id'

  has_many :roles, through: :memberships

  accepts_nested_attributes_for :groups, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :email

  # TODO: make separate controller for first time user?
  def is_admin?(group)
    m = Membership.find_by(group: group, user: self)
    m.role.name == 'admin'
  end

  def can_invite?(group)
    m = Membership.find_by(group: group, user: self)
    m.role.permissions.exists?(Permission.where(name: "Add Member"))
  end
  # Future do something like m.role.permission.find_by_name = "Add Task", or something
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :owned_groups, foreign_key: "owner_id", class_name: "Group"
  has_many :roles, through: :memberships

  accepts_nested_attributes_for :groups, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :email

  # TODO: make separate controller for first time user?
end

class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :role, optional: true

  validates_presence_of :user
  validates_presence_of :group

  before_create :set_default_role

  private
  def set_default_role
    self.role ||= Role.find_by_name('member')
  end
end

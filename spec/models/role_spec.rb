require 'rails_helper'

RSpec.describe Role, type: :model do
  let (:role) { FactoryGirl.create(:admin_role) }
  it "has a valid factory" do
    expect(role).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "association" do
    it { should have_many(:memberships) }
    it { should have_many(:users).through(:memberships) }
    it { should have_many(:role_permissions) }
    it { should have_many(:permissions).through(:role_permissions) }
  end
end

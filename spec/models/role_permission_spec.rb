require 'rails_helper'

RSpec.describe RolePermission, type: :model do
  let (:role_permission) { FactoryGirl.create(:role_permission) }
  it "has a valid factory" do
    expect(role_permission).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_presence_of(:permission) }
  end

  describe "association" do
    it { should belong_to(:role) }
    it { should belong_to(:permission) }
  end
end

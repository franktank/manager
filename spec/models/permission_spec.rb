require 'rails_helper'

RSpec.describe Permission, type: :model do
  let (:permission) { FactoryGirl.create(:permission) }
  it "has a valid factory" do
    expect(permission).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "association" do
    it { should have_many(:role_permissions) }
    it { should have_many(:roles).through(:role_permissions) }
  end
end

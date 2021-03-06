require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { FactoryGirl.create(:user) }
  it "has a valid factory" do
    expect(user).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe "association" do
    it { should have_many(:memberships) }
    it { should have_many(:groups).through(:memberships) }
    it { should have_many(:owned_groups) }
    it { should have_many(:roles).through(:memberships) }
    it { should have_many(:invitations) }
    it { should have_many(:sent_invites) }
  end
end

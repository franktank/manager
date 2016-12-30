require 'rails_helper'

RSpec.describe Group, type: :model do
  let (:group) { FactoryGirl.create(:group) }
  it "has a valid factory" do
    expect(group).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "association" do
    it { should have_many(:memberships) }
    it { should have_many(:users).through(:memberships) }
  end
end

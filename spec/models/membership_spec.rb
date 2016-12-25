require 'rails_helper'

RSpec.describe Membership, type: :model do
  let (:m) { FactoryGirl.create(:membership) }
  it { should belong_to(:user) }
  it { should belong_to(:group) }
  
  it "has a valid factory" do
    expect(m).to be_valid
  end

  describe "assocations" do
    it "belongs to a user" do
      expect(m.user).to_not be_nil
    end

    it "belongs to a group" do
      expect(m.group).to_not be_nil
    end

    it "is not valid without a user" do
      m.user = nil
      expect(m).to_not be_valid
    end

    it "is not valid without a group" do
      m.group = nil
      expect(m).to_not be_valid
    end
  end
end

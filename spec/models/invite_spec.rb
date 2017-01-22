require 'rails_helper'

RSpec.describe Invite, type: :model do
  let (:invite) { FactoryGirl.create(:invite) }
  it "has a valid factory" do
    expect(invite).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe "association" do
    it { should belong_to(:sender) }
    it { should belong_to(:group) }
    it { should belong_to(:recipient) }
  end
end

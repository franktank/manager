require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { FactoryGirl.create(:user) }
  it "has a valid factory" do
    expect(user).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
  end
end

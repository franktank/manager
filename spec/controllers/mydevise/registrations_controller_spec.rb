require "rails_helper"

RSpec.describe Mydevise::RegistrationsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  describe "signing up for a user with group name" do
    let (:user_params) do
      FactoryGirl.attributes_for(:user,
                                 email: "franky@trac.com",
                                 password: "password",
                                 groups_attributes: [ name: "trac" ] )
    end

    it "creates a new user, group, and membership" do
      expect {
        post :create, params: { user: user_params }
      }.to change{User.count}.by(1)
    end

    it "creates a new group" do
      expect {
        post :create, params: { user: user_params }
      }.to change{Group.count}.by(1)
    end

    it "creates a new membership" do
      expect {
        post :create, params: { user: user_params }
      }.to change{Membership.count}.by(1)
    end

    describe "the response" do
      before(:each) { post :create, params: { user: user_params } }

      it "redirects to root path" do
        expect(response).to redirect_to root_path
      end
    end
  end
end

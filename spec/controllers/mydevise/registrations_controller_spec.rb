require "rails_helper"

RSpec.describe Mydevise::RegistrationsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  let(:role) { FactoryGirl.create(:admin_role) }
  let(:role_permission) { FactoryGirl.create(:admin_role_permission) }
  let(:permission) { FactoryGirl.create(:permission) }

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

    it "assigns the new user as owner of the group" do
      post :create, params: { user: user_params }
      expect(User.last).to eq(Group.last.owner)
    end

    it "assigns admin role to the membership" do
      @admin_role = FactoryGirl.create(:admin_role)
      @permission = FactoryGirl.create(:permission)
      @rp = RolePermission.create(role: @admin_role, permission: @permission)
      post :create, params: { user: user_params }
      expect(Membership.last.role.name).to eq('admin')
    end

    describe "the response" do
      before(:each) { post :create, params: { user: user_params } }

      it "redirects to root path" do
        expect(response).to redirect_to root_path
      end
    end
  end
end

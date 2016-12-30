module Api
  class GroupsController < ApplicationController
    def create
      # Do I need to create membership here?
      @group = Group.create(group_params)
      # Set owner and role for current user and group being created
      @group.owner = current_user
      @group.save
      m = current_user.memberships.where(group: @group).first
      m.role = Role.where(name: "admin").first
      m.save
      render json: @group
    end

    private

    def group_params
      params.require(:group).permit(:name)
    end
  end
end

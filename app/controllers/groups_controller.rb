class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

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

  def edit
    @group = Group.find(params[:id])
    if !current_user.can_invite?(@group)
      redirect_to root_path
      # Send error message, not allowed to go here!
    end
  end

  def update
    # TODO:
    # Validate to see if current user is owner or admin before letting them access this page
    @group = Group.find(params[:id])
    if current_user.is_admin?(@group)
      # Create invite / update the group?
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

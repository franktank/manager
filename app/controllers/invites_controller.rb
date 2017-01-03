class InvitesController < ApplicationController
  before_action :authenticate_user!

  def new
    @invite = Invite.new
  end

  def create
    # TODO: Need to validate permission
    # Do I need validation? To access create form, user must be owner/admin and authenticated
    # TODO: Validate the group admin_user is inviting person to is a group of the admin_user, and that the admin_user is an admin/owner of that group

    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    # Check @invite.group_id and compare with current_user, group, membership and see if admin role or owner of group
    # Permission -> prob need to refactor in future
    if @invite.save
      if @invite.recipient != nil
        InviteMailer.invite_existing_user_email(@invite).deliver_now # Notify user of invitations
        @invite.recipient.groups.push(@invite.group) # Add the existing user to the specified group
        redirect_to root_path
      else
        InviteMailer.invite_new_user_email(@invite, new_user_registration_path(invite_token: @invite.token)).deliver_now
        redirect_to root_path
      end
    else
      # Notify current user that invite failed!
      redirect_to root_path
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:group_id, :email)
  end
end

module Mydevise
  class RegistrationsController < Devise::RegistrationsController
    def new
      build_resource({})
      yield resource if block_given? # Do I need ths?
      self.resource.groups.build
      @token = params[:invite_token]
      respond_with self.resource
    end

    def create
      super
      if params[:invite_token]
        invitation = Invite.find_by_token(params[:invite_token])
        group_invited_to = Invite.find_by_token(params[:invite_token]).group
        invite_sender = invitation.sender
        # Check to see if they are admin in group as well -> search memberships
        sender_role = Membership.find_by(user: invite_sender, group: group_invited_to).role
        if invite_sender = group_invited_to.owner || sender_role.name == 'admin' # Validates that the sender is allowed to invite
          resource.groups.push(group_invited_to)
          m = resource.memberships.find {|item| item.group_id == group_invited_to.id }
          m.role = Role.where(name: "member").first
          m.save
          # Set invitation.recipient to resource? Keep track of who invited the user
          invitation.recipient = resource
          invitation.save
        else
          # Improper invitation / Form was tampered with
        end
      else
        resource_group = self.resource.groups.first
        resource_group.owner = resource
        resource_group.save
        m = resource.memberships.where(group: resource_group).first
        m.role = Role.where(name: "admin").first
        m.save
      end
    end
  end
end

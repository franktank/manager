class InviteMailer < ApplicationMailer
  default from: 'franky@trac.com'

  def invite_new_user_email(invite, registration_url)
    @invite = invite
    @url = registration_url
    @group = Group.find_by(id: invite.group_id)
    mail(to: @invite.email, subject: "Invitation to join #{@group.name}")
  end

  def invite_existing_user_email(invite)
    @invite = invite
    @group = Group.find_by(id: invite.group_id)
    mail(to: @invite.email, subject: "Invitation to join #{@group.name}")
  end
end

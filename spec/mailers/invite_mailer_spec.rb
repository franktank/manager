require "rails_helper"

RSpec.describe InviteMailer, type: :mailer do
  let (:invite) { FactoryGirl.create(:invite) }
  it 'invite_new_user_email is sent' do
    url = "https://trackhours.com"
    expect {
      InviteMailer.invite_new_user_email(invite, url).deliver_now
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it 'invite_new_user_email is sent to the right user' do
      url = "https://trackhours.com"

      InviteMailer.invite_new_user_email(invite, url).deliver_now

      mail = ActionMailer::Base.deliveries.last
      expect(mail.to[0]).to eq invite.email
  end

  it 'invite_existing_user_email is sent' do
    expect {
      InviteMailer.invite_existing_user_email(invite).deliver_now
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it 'invite_existing_user_email is sent to the right user' do

      InviteMailer.invite_existing_user_email(invite).deliver_now

      mail = ActionMailer::Base.deliveries.last
      expect(mail.to[0]).to eq invite.email
  end
end

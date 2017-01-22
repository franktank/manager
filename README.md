# hour-manager

## Open source to collaborate

If you would like to contribute
- Open issues for features / bugs
- Create branch, commit changes, and submit pull request

## Tips on submitting a PR
To ensure your branch is able to be merged into master

- git fetch
- git checkout origin/master
- git branch -D master
- git checkout -b master
- git checkout CURRENT-WORKING-BRANCH
- git rebase master

Ensure merge conflicts are handled, and after finishing, squash commits into a single commit by doing

- git rebase -i master

## Current features

- Users have many Groups through Memberships
- Users have many Roles through Memberships
- Roles have many Permissions through RolePermissions
- Groups have an Owner that is a User
- Invites belongs to a Group, Sender, and Recipient

Features:
- Users can sign up and create a Group at the same time, the user signing up will be added as the owner of the group and have a role of admin in the group.

- Users with proper role can add user to a group through email invite. If the recipient is not a user in the database, then an email is sent with a registration link. If the recipient is signed up, then they are invited to join the group

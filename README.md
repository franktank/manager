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

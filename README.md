Git Synchronizer
================


Git Synchronizer allows you to sync local changes with a remote repository
as a Work in progress commit, capping off the remote version of the current 
local branch. Synchronization happens on file save(!!!)

It is meant for testing changes when a local server can not be
run and a remote server is serving the contents of the git repository 
remotely.


### Usage

On Unix machines, install by running `./install.sh`. (This installs git-sync in
`/usr/local/bin`. )

Then run `git-sync` (or `path/to/git-sync/git-sync` if not installed) in the root 
directory of the repository to be synced.

The remote branch corresponding to the local branch must be configured beforehand
with 
`git branch --set-upstream-to {remote}/{remote_branch_name} {local_branch_name}`.

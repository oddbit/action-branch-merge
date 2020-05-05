# Branch Merge Action

Automatically merge one branch into another.

This can be useful to automatically merge `develop` into `staging` when a sprint
is finished (milestone closed).

If the merge is not necessary, the action will do nothing.
If the merge fails due to conflicts, the action will fail, and the repository
maintainer should perform the merge manually.

## Installation

```yml
name: End of sprint
on:
  milestone:
    types: [closed]
jobs:
  nightly-merge:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v2

    - name: Merge branch
      uses: oddbit/action-branch-merge@master
      with:
        target_branch: 'staging'
        source_branch: 'develop'
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```


## Parameters

### `target_branch`

The name of the stable branch (default `master`).

### `source_branch`

The name of the development branch (default `develop`).

### `allow_ff`

Allow fast forward merge (default `false`). If not enabled, merges will use
`--no-ff`.

### `allow_git_lfs`

Allow support for repositories that use `git lfs` (default `false`). 

### `ff_only`

Refuse to merge and exit unless the current HEAD is already up to date or the
merge can be resolved as a fast-forward (default `false`).
Requires `allow_ff=true`.

### `allow_forks`

Allow action to run on forks (default `false`).

### `user_name`

User name for git commits (default `GitHub Branch Merge Action`).

### `user_email`

User email for git commits (default `actions@github.com`).

### `push_token`

Environment variable containing the token to use for push (default
`GITHUB_TOKEN`).
Useful for pushing on protected branches.
Using a secret to store this variable value is strongly recommended, since this
value will be printed in the logs.
The `GITHUB_TOKEN` is still used for API calls, therefore both token should be
available.

```yml
      with:
        push_token: 'FOO_TOKEN'
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        FOO_TOKEN: ${{ secrets.FOO_TOKEN }}
```

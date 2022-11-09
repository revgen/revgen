#!/bin/bash
if [ -z "${GITPOD_WORKSPACE_ID}" ]; then
    echo "Error: the script is setup environemnt for Gitpod Workspace"
    echo "Looks like it is not a Gitpod Workspace environment. Skip."
    exit 1
fi

# Documentation:
# * https://www.gitpod.io/docs/configure/user-settings/dotfiles
# * https://www.gitpod.io/blog/personalize-your-gitpod-workspace-environment
# Template:
# * https://github.com/gitpod-io/demo-dotfiles-with-gitpod

TMPDIR="$(mktemp -d)"
CURRENT="${PWD}"
cd "${TMPDIR}"

for script in ~/.dotfiles/scripts/gitpod/*; do
  bash "${script}"
done


echo -e "
# Custom user settings
alias tig='tig --all'
alias ws='cd ${GITPOD_REPO_ROOT} && pwd'
alias l='ll'
alias lt='ls -ATlh'
" > "${HOME}/.bashrc.d/99-user"

cd "${CURRENT}"
rm -rf "${TMPDIR}"
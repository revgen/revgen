#!/bin/bash
if [ -z "${GITPOD_WORKSPACE_ID}" ]; then
    echo "Error: the script is setup environemnt for Gitpod Workspace"
    echo "Looks like it is not a Gitpod Workspace environment. Skip."
    exit 1
fi

TMPDIR="$(mktemp -d)"
CURRENT="${PWD}"
cd "${TMPDIR}"

for script in ~/.dotfiles/scripts/gitpod/*; do
  bash "${script}"
done

cd "${CURRENT}"
rm -rf "${TMPDIR}"
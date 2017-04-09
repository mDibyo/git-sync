#!/usr/bin/env bash


installation_target=/usr/local/bin/git-sync
if [ ! -f ${installation_target} ]; then
  project_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
  ln -s ${project_dir}/git-sync ${installation_target}
fi

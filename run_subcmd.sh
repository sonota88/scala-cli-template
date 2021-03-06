#!/bin/bash

_get_project_dir() {
  if [ -L $0 ] ; then
    # シンボリックリンク
    dirname $(readlink $0)
  else
    echo $(cd $(dirname $0); pwd)
  fi

  return 0
}

# --------------------------------
# Main

CURRENT_DIR=$(pwd)
PROJECT_DIR=$(_get_project_dir)
cd $PROJECT_DIR

source "${PROJECT_DIR}/common.sh"

_exec_sbt sample.SubcmdMain "${CURRENT_DIR}" "${PROJECT_DIR}" "$@"

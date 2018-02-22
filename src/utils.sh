#!/usr/bin/env bash

shells::has_cmd() {
  hash $1 2>/dev/null
}

shells::get_running_shell() {
  echo $(ps -q $$ -ocomm=)
}

shells::get_os() {
  local os_str=${1:-$OSTYPE}
  case "$os_str" in
    darwin*)  echo "OSX" ;;
    linux*)   echo "LINUX" ;;
    msys*)    echo "WINDOWS" ;;
    bsd*)     echo "BSD" ;;
    solaris*) echo "SOLARIS" ;;
    *)        echo "unknown: $os_str" ;;
  esac
}

shells::get_external_ip() {
  echo $(dig +short myip.opendns.com @resolver1.opendns.com)
}

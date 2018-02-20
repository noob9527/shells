#!/usr/bin/env bash

SHELLS_COLOR_RESET='\033[0m'
SHELLS_COLOR_BLUE='\033[94m'
SHELLS_COLOR_GREEN='\033[92m'
SHELLS_COLOR_YELLOW='\033[93m'
SHELLS_COLOR_PURPLE='\033[95m'
SHELLS_COLOR_RED='\033[91m'

#$1: msg
#$2: color
shells::colorful::print() {
  local msg="$1"
  local color=${2-${COLOR_RESET}}
  echo -e "${color}$msg${COLOR_RESET}"
}

#$1: msg
shells::colorful::default() {
  shells::colorful::print "$1" ${COLOR_RESET}
}

#$1: msg
shells::colorful::primary() {
  shells::colorful::print "$1" ${COLOR_BLUE}
}

#$1: msg
shells::colorful::success() {
  shells::colorful::print "$1" ${COLOR_GREEN}
}

#$1: msg
shells::colorful::warn() {
  shells::colorful::print "$1" ${COLOR_YELLOW}
}

#$1: msg
shells::colorful::error() {
  shells::colorful::print "$1" ${COLOR_MAGENTA}
}

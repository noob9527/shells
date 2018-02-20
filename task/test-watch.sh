#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
PROJECT_DIR=$(dirname "$DIR")

shopt -s globstar

# Run this file (with 'entr' installed) to watch all files and rerun tests on changes
BASEDIR=$(dirname $(dirname "$0"))
ls -d $PROJECT_DIR/test/tests/**/*.bats | entr $PROJECT_DIR/task/test.sh

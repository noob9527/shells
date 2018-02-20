#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
PROJECT_DIR=$(dirname "$DIR")

shopt -s globstar

# Run this file to run all the tests, once
$PROJECT_DIR/test/lib/bats/bin/bats $PROJECT_DIR/test/tests/**/*.bats

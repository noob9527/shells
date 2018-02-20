#!/usr/bin/env bash

# https://stackoverflow.com/questions/1527049/join-elements-of-an-array
shells::join_by() {
    local IFS="$1";
    shift;
    echo "$*";
}

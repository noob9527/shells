#!/usr/bin/env bash

shells::restore_symbol_link() {
  for arg in "$@"; do
      cp --remove-destination "$(readlink "$arg")" "$arg"
  done
}


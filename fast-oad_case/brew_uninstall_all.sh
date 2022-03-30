#!/usr/bin/env bash

while [[ $(brew list --formulae | wc -l) -ne 0 ]]; do
    for EACH in $(brew list --formulae); do
        brew uninstall --force --ignore-dependencies "$EACH"
    done
done
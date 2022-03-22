#!/usr/bin/env bash

shopt -s dotglob

home=~/
for filepath in $(find * -type f -print); do
    if [[ "$filepath" != `basename "$0"` ]] && ! cmp -s "$home$filepath" "$filepath"; then
        printf "\nChanges in $filepath\n\n"
        diff --color -u "$filepath" "$home$filepath"
        cp "$home$filepath" "$filepath"
        printf "\nChanges applied\n\n   ------\n"
    fi
done

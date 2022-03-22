#!/usr/bin/env bash

shopt -s dotglob

printf "\nChecking for dotfiles changes"

home=~/
excluded_paths=(.git/ .gitignore)

for filepath in $(find * -type f -print); do
    watch_file=true
    for excluded_path in ${excluded_paths[*]}; do
        if [[ "$filepath" == *$excluded_path* ]]; then
            watch_file=false
            break
        fi
    done

    if [[ $watch_file == true ]] && [[ "$filepath" != `basename "$0"` ]] && ! cmp -s "$home$filepath" "$filepath"; then
        printf "\nChanges in $filepath\n\n"
        diff --color -u "$filepath" "$home$filepath"
        read -p "Do you want to apply those changes [y,n]? " -r validation
        if [[ $validation =~ ^[Yy]$ ]]; then
            cp "$home$filepath" "$filepath"
            printf "\nChanges applied\n\n   ------\n"
        else
            printf "\nNo changes applied for $filepath\n"
        fi
    fi
done

printf "\nDotfiles checked\n"


#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

function link(){
    local file="$1"
    local dest="$2"
    ln --symbolic --force "$PWD/$file" "$dest/$file"
}

HOME_FILES=$(yq '.home[]' manifest.yaml)

for file in $HOME_FILES; do
    link "$file" "$HOME"
done

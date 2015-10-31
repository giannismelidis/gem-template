#!/usr/bin/env bash

set -e

function abort
{
    echo "$1"
    exit 1
}

function require_variable
{
    if [[ -z "$1" ]]
    then
        abort "$2"
    fi
}

require_variable "$NAME" "You must specify the name in NAME"
require_variable "$NAMESPACE" "You must specify the namespace in NAMESPACE"
require_variable "$DIRECTORY" "You must specify the directory in DIRECTORY"

target="$DIRECTORY/$NAME"

if [[ -d "$target" ]]
then
    abort "The target directory already exists, aborting..."
fi

echo 'Moving files...'

cp -r ./template "$target"

echo 'Replacing placeholders...'

find "$target" -type f | xargs perl -i -p -e "s/GEM_NAMESPACE/$NAMESPACE/g"
find "$target" -type f | xargs perl -i -p -e "s/GEM_NAME/$NAME/g"

echo 'Renaming files...'

for file in $(find "$target" -name "*GEM_NAME*")
do
    mv "$file" $(echo "$file" | perl -p -e "s/GEM_NAME/$NAME/g")
done

echo 'Done!'

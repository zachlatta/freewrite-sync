#!/bin/bash

TMP=$(mktemp -d)

pushd $TMP

### SYNCING FOLDER A ###

mkdir A
pushd A

rclone move gdrive:Postbox/A .

# change .txt files to .md
for f in *.txt; do
  mv -- "$f" "${f%.txt}.md"
done

mv * /txt/obsidian/

popd

### CLEANUP ###

popd
rm -rf $TMP

# freewrite-sync

A personal script to sync notes written on a Freewrite electronic typewriter to
my personal file organization system.

## Config

It expects an rclone config file to be housed at /config/rclone/rclone.conf.
This will have to be pre-setup. It expects the Google Drive remote in Rclone to
be called `gdrive`.

It expects the destination text directory to be at `/txt` and to follow my
personal file organization systems's format. It is not meant to be configurable
for general usage by others.

File destinations:

- Folder A: Obsidian root directory
- Folder B: Daily journal root directory
- Folder C: TBD. Right now just goes to Obsidian root directory.

## Sync steps

Freewrite Postbox stores files in `Google Drive Root`/`Postbox`/`(A, B, or C)`
in the following format: `YYYY-MMM-DD Truncated First Line.txt` (assuming
Postbox is configured to sync txt files instead of docx).

Example filename: `2022-May-27 Friday, May 27th, 20.txt`. The `222-May-27` is
generated by Postbox, the `Friday, May 27th, 20` is a truncated first line of
the file.

1. Move files from Google Drive to a temporary sync directory
2. Rename the files from .txt to .md
3. Apply any other wanted transformations to files
4. Move files to final destination in personal file organization system

## Running the script

This script is intended to be run from the Synology Task Scheduler on regular
intervals (ex. every 10 minutes).

Example invocation of this script:

    docker run --rm -i -v /volume1/pokedex/apps/freewrite-sync/config/rclone /config/rclone -v /volume1/pokedex/txt:/txt zachlatta/freewrite-sync

## License


Copyright 2022 Zach Latta

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

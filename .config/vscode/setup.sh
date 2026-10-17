#!/bin/sh
set -eu
cd "$(dirname "$0")"

app="/Applications/Visual Studio Code.app/Contents"
sed 's/#.*//' extensions.txt | grep . | sed 's/^/--install-extension /' |
    ELECTRON_RUN_AS_NODE=1 xargs "$app/MacOS/Code" --no-deprecation \
        "$app/Resources/app/out/cli.js"

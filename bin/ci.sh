#!/usr/bin/env sh

CURRENT_DIR=$(pwd)
cd packages/widget_toolkit && bin/ci.sh && cd "$CURRENT_DIR" || exit

cd packages/widget_toolkit/example && bin/ci.sh && cd "$CURRENT_DIR" || exit
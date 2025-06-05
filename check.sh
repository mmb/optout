#!/bin/bash

set -eu
set -o pipefail

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

jq --sort-keys < optout.json > "$TMPFILE"

diff -u "$TMPFILE" optout.json

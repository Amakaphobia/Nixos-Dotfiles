#!/usr/bin/env bash

set -euo pipefail

# get the name of the current layout
# uses jq to extract that string
current_layout="$(
  hyprctl -j getoption general:layout |
    jq -r '.str'
)"

# set next_layout based on the string
if [[ "$current_layout" == "dwindle" ]]; then
  next_layout="scrolling"
else
  next_layout="dwindle"
fi

# request hyprctl to change layout to the previously decided upon layout
hyprctl keyword general:layout "$next_layout"

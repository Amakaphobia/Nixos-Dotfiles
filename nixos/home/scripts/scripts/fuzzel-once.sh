#!/usr/bin/env bash
pgrep fuzzel >/dev/null 2>&1 && pkill fuzzel || fuzzel

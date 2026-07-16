#!/usr/bin/env bash
pgrep -f \"^/run/current-system/sw/bin/firefox( |$)\" >/dev/null 2>&1 || exec firefox

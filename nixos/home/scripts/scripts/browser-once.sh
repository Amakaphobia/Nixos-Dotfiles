#!/usr/bin/env bash
set -euo pipefail
pgrep -x firefox >/dev/null 2>&1 || exec firefox

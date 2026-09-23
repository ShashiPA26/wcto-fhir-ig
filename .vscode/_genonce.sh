#!/bin/bash
set -euo pipefail
exec "$(dirname "$0")/_build.sh" build "$@"

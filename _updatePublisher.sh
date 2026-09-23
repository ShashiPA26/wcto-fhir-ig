#!/bin/bash
set -euo pipefail

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required to update the FHIR IG Publisher." >&2
  exit 1
fi

"$(dirname "$0")/_build.sh" update

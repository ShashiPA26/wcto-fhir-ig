#!/bin/bash
set -euo pipefail

publisher_jar="publisher.jar"
input_cache_path="$(pwd)/input-cache"
publisher_home="${FHIR_PUBLISHER_HOME:-$HOME/.fhir/tools/publisher}"
download_url="https://github.com/HL7/fhir-ig-publisher/releases/latest/download/${publisher_jar}"

find_publisher() {
  if [[ -f "${input_cache_path}/${publisher_jar}" ]]; then
    printf '%s\n' "${input_cache_path}/${publisher_jar}"
  elif [[ -f "../${publisher_jar}" ]]; then
    printf '%s\n' "../${publisher_jar}"
  elif [[ -f "${publisher_home}/${publisher_jar}" ]]; then
    printf '%s\n' "${publisher_home}/${publisher_jar}"
  else
    printf '%s\n' ""
  fi
}

publisher="$(find_publisher)"
run_publisher() {
  if [[ -z "${publisher}" ]]; then
    echo "IG Publisher not found. Run './_build.sh update' first." >&2
    exit 1
  fi
  export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"
  java ${JAVA_OPTS:-} -jar "${publisher}" -ig . "$@"
}

update_publisher() {
  mkdir -p "${input_cache_path}"
  echo "Downloading the latest IG Publisher..."
  curl --fail --location --progress-bar "${download_url}" -o "${input_cache_path}/${publisher_jar}"
}

cleanup() {
  rm -rf input-cache temp output template out
  echo "Removed generated publisher directories (input-cache was recreated on demand)."
}

case "${1:-build}" in
  update) update_publisher ;;
  build) shift || true; run_publisher "$@" ;;
  nosushi) shift || true; run_publisher -no-sushi "$@" ;;
  notx) shift || true; run_publisher -tx n/a "$@" ;;
  watch|continuous) shift || true; run_publisher -watch "$@" ;;
  clean) cleanup ;;
  jekyll) jekyll build -s temp/pages -d output ;;
  *) run_publisher "$@" ;;
esac

#!/bin/bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
publisher_jar="publisher.jar"
input_cache_path="${script_dir}/input-cache"

echo "Checking internet connection..."
if curl -sSf tx.fhir.org > /dev/null; then
	echo "Online"
	tx_args=()
else
	echo "Offline"
	tx_args=("-tx" "n/a")
fi

export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"

publisher=""
if [ -f "${input_cache_path}/${publisher_jar}" ]; then
	publisher="${input_cache_path}/${publisher_jar}"
elif [ -f "${script_dir}/../${publisher_jar}" ]; then
	publisher="${script_dir}/../${publisher_jar}"
elif [ -n "${FHIR_PUBLISHER_HOME:-}" ] && [ -f "${FHIR_PUBLISHER_HOME}/${publisher_jar}" ]; then
	publisher="${FHIR_PUBLISHER_HOME}/${publisher_jar}"
elif [ -n "${HOME:-}" ] && [ -f "${HOME}/.fhir/tools/publisher/${publisher_jar}" ]; then
	publisher="${HOME}/.fhir/tools/publisher/${publisher_jar}"
fi

if [ -z "$publisher" ]; then
	echo "IG Publisher not found. Run ./_updatePublisher.sh -y or install it in ~/.fhir/tools/publisher." >&2
	exit 1
fi

echo "Using IG Publisher: ${publisher}"
cd "$script_dir"
java -jar "$publisher" -ig . "${tx_args[@]}" "$@"
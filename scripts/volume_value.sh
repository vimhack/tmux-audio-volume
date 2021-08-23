#!/usr/bin/env bash
# volume_value.sh
#

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=SC1090
source "$CURRENT_DIR/helpers.sh"

print_output_volume_value

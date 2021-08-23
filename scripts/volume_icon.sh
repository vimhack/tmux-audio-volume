#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=SC1090
source "$CURRENT_DIR/helpers.sh"

speaker_low_volume_icon="🔈"
speaker_medium_volume_icon="🔉"
speaker_high_volume_icon="🔊"
speaker_muted_volume_icon="🔇"
headphone_icon="🎧"

print_volume_icon() {
    local volume_value volume_type
    volume_value=$(print_output_volume_value)
    volume_type=$(print_volume_type)

    if [[ "$volume_type" = "BuiltInHeadphoneOutputDevice" ]]; then
        echo $headphone_icon
    else
        if [[ "$volume_value" = "0" ]]; then
            echo $speaker_muted_volume_icon
        elif [[ "$volume_value" -lt 30 ]]; then
            echo $speaker_low_volume_icon
        elif [[ "$volume_value" -ge 30 ]] && [[ "$volume_value" -lt 70 ]]; then
            echo $speaker_medium_volume_icon
        else
            echo $speaker_high_volume_icon
        fi
    fi
}

main() {
    print_volume_icon
}

main

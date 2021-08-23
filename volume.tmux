#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=SC1090
source "$CURRENT_DIR/scripts/helpers.sh"

interpolation=(
    "\#{volume_icon}"
    "\#{volume_value}"
)

commands=(
    "#($CURRENT_DIR/scripts/volume_icon.sh)"
    "#($CURRENT_DIR/scripts/volume_value.sh)"
)

do_interpolation() {
    local all_interpolated="$1"

    for ((i = 0; i < ${#commands[@]}; i++)); do
        all_interpolated=${all_interpolated//${interpolation[$i]}/${commands[$i]}}
    done

    echo "$all_interpolated"
}

update_tmux_option() {
    local option="$1"
    local option_value new_option_value

    option_value="$(get_tmux_option "$option")"
    new_option_value="$(do_interpolation "$option_value")"

    set_tmux_option "$option" "$new_option_value"
}

main() {
    update_tmux_option "status-right"
    update_tmux_option "status-left"
}

main

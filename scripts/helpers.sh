#!/usr/bin/env bash

is_macos() {
    [[ "$(uname)" = "Darwin" ]]
}

command_exists() {
    local command="$1"
    type "$command" >/dev/null 2>&1
}

get_tmux_option() {
    local option="$1"
    local default_value="$2"
    local option_value

    option_value="$(tmux show-option -gqv "$option")"

    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

set_tmux_option() {
    local option="$1"
    local value="$2"

    tmux set-option -gq "$option" "$value"
}

# For MacOS:
#   BuiltInSpeakerDevice
#   BuiltInHeadphoneOutputDevice
print_volume_type() {
    if is_macos; then
        if command_exists SwitchAudioSource; then
            SwitchAudioSource -c -f cli | awk -F, '{print $NF}'
        else
            echo "installation: brew install switchaudio-osx"
        fi
    else
        echo "os not support"
    fi
}

print_output_volume_value() {
    if is_macos; then
        osascript -e 'output volume of (get volume settings)'
    else
        echo "os not support"
    fi
}

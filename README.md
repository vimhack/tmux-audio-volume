# tmux-audio-volume

Show audio volume icon and value in the tmux status-right.

Currently only support MacOS.

## Installation

### Requirements

For MacOS:

```bash
brew install switchaudio-osx
```

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

Add plugin to the list of TPM plugins in your `.tmux.conf`:

```bash
set -g @plugin 'windvalley/tmux-audio-volume'
```

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

## Usage

Add format strings (see below) to the existing `status-right` tmux option.

Format strings:

- `#{volume-value}`
- `#{volume-icon}`

Example:

```bash
# in your .tmux.conf
set -g status-right '#{volume-icon}#{volume-value}'
```

# Search All Tmux Panes

The Tmux plugin allows you to search for panes across all windows in all running sessions.

## Usage

Hit `prefix` + `@open_search_panes_key` (default: v) to search for.
The plugin opens live search (fzf) with previews for all panes in all windows/sessions.
Press Enter to open the selected pane, or Esc to abort.

## Installation

### Requirements

- [GNU bash](https://www.gnu.org/software/bash/)
- [fzf](https://github.com/junegunn/fzf/)

### Using [TPM](https://github.com/tmux-plugins/tpm/)

Add this line to your `~/.tmux.conf`

```tmux
set -g @plugin 'EasonMo/tmux-panes-picker'
```

Reload configuration, then press `prefix` + `I`.

### Manually

Clone the repo somewhere, add `run-shell ~/clone/path/tmux-panes-picker.tmux` to your `tmux.conf`.

### License

[MIT](LICENSE)

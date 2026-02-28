# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles repo for tmux configuration. Part of a five-repo tooling stack (`unix-utils`, `oh-my-zsh`, `tmux`, `neovim`, `ghostty`). Two files: `.tmux.conf` (tmux settings) and `init.sh` (cross-platform installer).

## Setup

```bash
./init.sh
```

The install script:
- Requires `~/unix-utils/` to be set up first (provides copyq for clipboard integration)
- Requires `~/oh-my-zsh/` for helper scripts referenced in keybindings
- Installs tmux: `brew install tmux` (macOS) / `apt install tmux` (Linux)
- Installs powerline fonts
- Installs TPM (tmux plugin manager) and plugins (resurrect, continuum)
- Symlinks: `~/tmux/.tmux.conf` -> `~/.tmux.conf`
- All steps are idempotent (safe to re-run)

## Config

The `.tmux.conf` is organized in labeled sections:
- **Platform detection** -- OS-aware shell path, true color overrides
- **Status bar** -- minimal, centered window list, no clutter
- **Window/pane settings** -- 1-indexed, renumber on close, zero escape delay
- **Mouse** -- scroll enabled, drag disabled, click selects pane
- **Terminal** -- true color, 50k scrollback, Ghostty extended keys
- **Copy mode** -- vim keybindings, visual selection, yank to copyq clipboard
- **Keybindings** -- `C-a` prefix, splits with `/` and `s`, neovim integration (`C-v`, `C-s`, `C-c`), AI tool bindings, word picker via fzf
- **Appearance** -- active pane background, yellow current window tab
- **Plugins** -- TPM, resurrect (save/restore sessions), continuum (auto-save)

Always edit `~/tmux/.tmux.conf` (source), never `~/.tmux.conf` (symlink target).

## Conventions

Follows the shared pattern across all five tooling repos:
- `init.sh` detects OS, branches on macOS/Linux, uses idempotent checks, symlinks config at the end
- `set -e` for fail-loud behavior
- Config comments explain the "why" for each setting

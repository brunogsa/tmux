# tmux

Cross-platform tmux configuration and installer. Vim-style copy mode, neovim integration, clipboard via copyq, and session persistence.

## Setup

```bash
# Prerequisites: ~/unix-utils/ (provides copyq) and ~/oh-my-zsh/ (provides helper scripts)
./init.sh
```

The script installs tmux, powerline fonts, TPM (plugin manager), and symlinks `.tmux.conf` to `~/.tmux.conf`. All steps are idempotent.

## What It Can Configure

Prefix key, copy mode bindings, mouse behavior, status bar appearance, neovim integration, and more. See [.tmux.conf](./.tmux.conf) for current settings and tmux docs for all available options.

## Platforms

- **macOS**: tmux via Homebrew, fonts via powerline installer
- **Linux**: tmux via apt, fonts via apt

## Part of

Five-repo tooling stack: [unix-utils](https://github.com/brunogsa/unix-utils) | [oh-my-zsh](https://github.com/brunogsa/oh-my-zsh) | **tmux** | [neovim](https://github.com/brunogsa/neovim) | [ghostty](https://github.com/brunogsa/ghostty)

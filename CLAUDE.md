# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository for macOS/Linux. Config files live in `dotfiles/` and are symlinked to `$HOME` by the installer. Comments are written in Japanese.

## Structure

- `dotfiles/` — actual config files (`.zshrc`, `.vimrc`, `.gitconfig`, `.alias`, etc.)
- `bin/install.sh` — symlinks everything in `dotfiles/` to `$HOME`, copies `support/env.example` to `$HOME/.env`
- `bin/uninstall.sh` — removes symlinks pointing back to this repo
- `support/env.example` — template for machine-specific env vars (`$HOME/.env`)
- `support/Afterglow.terminal` — macOS Terminal.app theme

## Key Design Decisions

- Machine-specific config goes in `$HOME/.env` (sourced by `.zshrc`), not in this repo
- Machine-specific shell setup goes in `$HOME/.profile` (also sourced by `.zshrc`)
- Vim plugin management uses Vundle (must be installed separately: `git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim`)
- `.gitconfig` contains hardcoded absolute paths (e.g. `excludesfile`) — these may need updating per machine

## Commands

```sh
bin/install.sh    # Symlink dotfiles to $HOME and copy env template
bin/uninstall.sh  # Remove symlinks pointing to this repo
```

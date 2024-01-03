#!/bin/bash

# This script should be used when a new environment is configured.

# Fish
## Symlink the folder from .dotfiles to .config 
ln -s ~/.dotfiles/.config/fish ~/.config/fish

## Install the Fisher plugin manager
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

## Install plugins via fisher
fisher install catppuccin/fish

# Git
## Symlink the folder from .dotfiles to .config
ln -s ~/.dotfiles/.config/git ~/.config/git

# tmux
## Symlink the folders from .dotfiles to .config and .tmux
ln -s ~/.dotfiles/.tmux ~/.tmux
ln -s ~/.dotfiles/.config/tmux ~/.config/tmux

# Neovim
## Symlink the folders from .dotfiles to .config
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim

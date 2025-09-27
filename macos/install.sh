#!/bin/bash
set -eu

# Install packages via Homebrew for macOS
#
# Usage:
# install.sh [--install-apps | -a]
#
#  --install-apps, -a : Install GUI apps listed in Brewfile_app
#
# Requirements:
# - Homebrew (https://brew.sh/)

# ================
# Install packages
# ================

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT

unset CDPATH
DIR=$(cd "$(dirname "$0")" && pwd)

brew bundle --file="$DIR/Brewfile"

install_apps="${1:-}"
if [ "$install_apps" = "--install-apps" ] || [ "$install_apps" = "-a" ]; then
  echo "Installing GUI apps via Brewfile_app"
  brew bundle --file="$DIR/Brewfile_app"
fi

# =================================
# Set up after package installation
# =================================

# Install tmux plugin manager
if ! [ -d "$HOME/.tmux/plugins/tpm" ] ; then
  mkdir -p "$HOME/.tmux/plugins/"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

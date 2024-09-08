#!/bin/bash

install_package() {
  local package=$1
  if ! brew list "$package" &> /dev/null; then
    echo "Installing $package..."
    brew install "$package"
  else
    echo "$package is already installed."
  fi
}

install_casks() {
  local cask_name=$1
  if ! brew list "$cask_name" &> /dev/null; then
    echo "Installing $cask_name..."
    brew install --cask "$cask_name"
  else
    echo "$cask_name is already installed."
  fi
}

# List of packages to install
packages=(
  stow
  git
  git-delta
  fzf
  tldr
  tmux
  jq
  ripgrep
  mas  # mac app store
  # Add more packages here
)

# Install each package in the list
for package in "${packages[@]}"; do
  install_package "$package"
done

casks=(
  iterm2
  visual-studio-code
  alt-tab
  miniconda
  hiddenbar
  font-meslo-for-powerlevel10k
  font-fira-code-nerd-font
  itsycal
  lulu
  obsidian
  raycast
  bitwarden
  karabiner-elements
)

# Install each cask in the list
for cask in "${casks[@]}"; do
  install_casks "$cask"
done

gem install colorls

echo "/nbrew.sh completed successfully."

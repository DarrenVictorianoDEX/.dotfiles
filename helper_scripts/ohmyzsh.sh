#!/bin/bash

install_oh_my_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    # the --unattended flag is to prevent oh-my-zsh installation script to create a new session.
    # if we dont do this, it will stop our installation script
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "oh-my-zsh is installed."
  else
    echo "oh-my-zsh is already installed."
  fi
}

install_powerlevel10k() {
  local p10k_dir="${ZSH_CUSTOM}/themes/powerlevel10k"
  if [ ! -d "$p10k_dir" ]; then
    echo "Installing powerlevel10k..."
    mkdir -p "${ZSH_CUSTOM}/themes"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_dir"
    echo "powerlevel10k is installed."
  else
    echo "powerlevel10k is already installed."
  fi
}

install_autosuggestions() {
  local autosuggest_dir="${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
  if [ ! -d "$autosuggest_dir" ]; then
    echo "Installing zsh-autosuggestions..."
    mkdir -p "${ZSH_CUSTOM}/plugins"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$autosuggest_dir"
    echo "zsh-autosuggestions installed."
  else
    echo "zsh-autosuggestions is already installed."
  fi
}

install_syntax_highlighting() {
  local syntax_highlight_dir="${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
  if [ ! -d "$syntax_highlight_dir" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$syntax_highlight_dir"
    echo "zsh-syntax-highlighting installed."
  else
    echo "zsh-syntax-highlighting is already installed."
  fi
}

# Execute functions
install_oh_my_zsh
install_powerlevel10k
install_autosuggestions
install_syntax_highlighting
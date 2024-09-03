#!/bin/bash

set -e  # Exit on any error

# Define variables
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
DOTFILES_DIR="$HOME/.dotfiles"

install_stow() {
  if ! command -v stow &> /dev/null; then
    echo "Installing GNU Stow..."
    brew install stow
    echo "GNU Stow is installed."
  else
    echo "GNU Stow is already installed."
  fi
}

install_oh_my_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "oh-my-zsh is installed."
  else
    echo "oh-my-zsh is already installed."
  fi
}
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/dotfiles/terminal_setup/install.sh)"

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

clone_dotfiles() {
  if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/DarrenVictoriano/dotfiles.git "$DOTFILES_DIR"
    echo "dotfiles repository cloned into $DOTFILES_DIR."
  else
    echo "dotfiles repository is already cloned."
  fi
}

stow_dotfiles() {
  if [ -d "$DOTFILES_DIR" ]; then
    echo "Stowing dotfiles..."
    cd "$DOTFILES_DIR"

    # Loop through each dotfile directory
    for dir in zshrc p10k hushlogin; do
      home_file="$HOME/.$dir"  # Construct the home directory file name with the prefix "."

      # Check if the corresponding file exists in the home directory and delete it
      if [ -e "$home_file" ]; then
        echo "Deleting existing file $home_file..."
        rm -f "$home_file"
        echo "$home_file deleted."
      fi

      # Stow the directory if it exists
      if [ -d "$dir" ] || [ -f "$dir" ]; then
        stow "$dir"
        echo "$dir is stowed."
      else
        echo "$dir does not exist in $DOTFILES_DIR, skipping..."
      fi
    done
  else
    echo "Dotfiles directory $DOTFILES_DIR does not exist. Cannot stow dotfiles."
  fi
}

# Main function to run all installations and configurations
main() {
  install_stow
  install_oh_my_zsh
  install_powerlevel10k
  install_autosuggestions
  install_syntax_highlighting
  clone_dotfiles
  stow_dotfiles
}

# Execute main function
main
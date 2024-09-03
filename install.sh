#!/bin/bash

# Function to install GNU Stow
install_stow() {
  echo "Installing GNU Stow..."
  brew install stow
  echo "stow is installed."
}

# Function to install Oh My Zsh
install_oh_my_zsh() {
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "oh-my-zsh is installed."
}

# Function to install Powerlevel10k theme
install_powerlevel10k() {
  echo "Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo "powerlevel10k is installed"
}

# Function to install Zsh Autosuggestions
install_autosuggestion() {
  echo "Installing Zsh Autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "zsh-autosuggestions installed"
}

# Function to install Zsh Syntax Highlighting
install_syntax_highlighting() {
  echo "Installing Zsh Syntax Highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "zsh-syntax-highlighting installed"
}

# Function to stow dotfiles
gnu_stow() {
  echo "Stowing dotfiles..."
  stow zshrc
  stow p10k
  stow hushlogin
  echo "dotfiles are stowed."
}

# Main function to run all installations and configurations
main() {
  install_stow
  install_oh_my_zsh
  install_powerlevel10k
  install_autosuggestion
  install_syntax_highlighting
  gnu_stow
}

# Execute main function
main
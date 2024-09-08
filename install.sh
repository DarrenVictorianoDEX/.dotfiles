#!/bin/bash

set -e  # Exit on any error

# Define variables
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
DOTFILES_DIR="$HOME/.dotfiles"

install_brew_packages() {
  echo "Installing homebrew and packages from brew.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/brew.sh)"
}

install_from_appstore() {
  echo "Install from Apple AppStore"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/appstore.sh)"
}

install_ohmyzsh() {
  echo "Installing oh-my-zsh and plugins from ohmyzsh.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/ohmyzsh.sh)"
}

clone_dotfiles() {
  if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/DarrenVictoriano/.dotfiles.git "$DOTFILES_DIR"
    echo "dotfiles repository cloned into $DOTFILES_DIR."
  else
    echo "dotfiles repository is already cloned."
  fi
}

stow_dotfiles() {
  # Ensure that the DOTFILES_DIR variable is set to the path of your dotfiles directory
  if [ -z "$DOTFILES_DIR" ]; then
    echo "DOTFILES_DIR is not set. Please set it to your dotfiles directory path."
    return 1
  fi

  # Check if the dotfiles directory exists
  if [ -d "$DOTFILES_DIR" ]; then
    echo "Stowing dotfiles..."
    cd "$DOTFILES_DIR" || return 1

    # Define two parallel arrays: one for directories and one for corresponding home files
    dirs=("zsh" "p10k" "hushlogin" "git" "zprofile")
    home_files=(".zshrc" ".p10k.zsh" ".hushlogin" ".gitconfig" ".zprofile")

    # Loop through each directory and corresponding home file
    for i in "${!dirs[@]}"; do
      dir="${dirs[$i]}"
      home_file="$HOME/${home_files[$i]}"

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

update_app_settings() {
  echo "changing MacOS defaults"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/app_settings.sh)"
}

# Main function to run all installations and configurations
main() {
  install_brew_packages
  install_from_appstore
  install_ohmyzsh
  clone_dotfiles
  stow_dotfiles
  update_app_settings
}

# Execute main function
main
echo "\nSetup completed. Quit this terminal session (cmd + q) then relaunch iTerm2 to see the updates."
#!/bin/bash

# Function to check if Zsh is being used
check_zsh() {
    if [[ "$(basename "$SHELL")" != "zsh" ]]; then
        echo "Switching to Zsh..."
        chsh -s "$(command -v zsh)" || {
            echo "Failed to switch to Zsh. Exiting..."
            exit 1
        }
        echo "Successfully switched to Zsh."
    else
        echo "Already using Zsh."
    fi
}

# Function to install Oh-My-Zsh
install_oh_my_zsh() {
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Modules to install using Homebrew
modules=("jq" "git-delta" "thefuck" "stow" "git")

# Install each module using Homebrew
for module in "${modules[@]}"; do
    echo "Installing $module..."
    brew install "$module"
done

# Fonts
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
brew install font-fira-code-nerd-font

# Check if Zsh is being used and switch to it if necessary
check_zsh

# Install OhMyZsh
install_oh_my_zsh

# install OhMyZsh Plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/superbrothers/zsh-kubectl-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-kubectl-prompt

# GNU Stow - Activate dotfiles
stow conda
stow git
stow hushlogin
stow p10k
# stow pip  # gitignored
stow zsh

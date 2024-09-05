#!/bin/bash

# Function to check if a package is installed and install it if not
install_package() {
  local package=$1
  if ! brew list "$package" &> /dev/null; then
    echo "Installing $package..."
    brew install "$package"
  else
    echo "$package is already installed."
  fi
}

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# List of packages to install
packages=(
  stow
  colorls
  # Add more packages here
)

# Install each package in the list
for package in "${packages[@]}"; do
  install_package "$package"
done

echo "All installations complete."
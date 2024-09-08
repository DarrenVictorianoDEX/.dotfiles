#!/bin/bash

# Function to check if an app is installed and install it if not
install_from_appstore() {
    local appid=$1
    local appname=$2

    # Check if the app is already installed
    if mas list | grep -q "$appid"; then
        echo "$appname is already installed."
    else
        echo "Installing $appname..."
        mas install "$appid"
    fi
}

# List of apps to install with their IDs and names
app_list=(
    "302584613:Kindle"
    "1018301773:AdBlock Pro"
    "441258766:Magnet"
)

# Install each app in the list
for app in "${app_list[@]}"; do
    appid="${app%%:*}"
    appname="${app##*:}"
    install_from_appstore "$appid" "$appname"
done

echo "\nApp installation completed."